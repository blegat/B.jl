import Base.==, Base.isless, Base.isapprox

Base.iszero(t::Term) = iszero(t.α)
Base.iszero(p::Polynomial) = isempty(p)

# TODO This should be in Base with T instead of PolyVar{C}.
# See https://github.com/blegat/MultivariatePolynomials.jl/issues/3
function (==){C}(x::Vector{PolyVar{C}}, y::Vector{PolyVar{C}})
    if length(x) != length(y)
        false
    else
        #for (xi, yi) in zip(x, y)
        for i in 1:length(x)
            if x[i] != y[i]
                return false
            end
        end
        true
    end
end

# Comparison of PolyVar

function (==){C}(x::PolyVar{C}, y::PolyVar{C})
    x.id == y.id
end

isless{C}(x::PolyVar{C}, y::PolyVar{C}) = isless(y.id, x.id)

# Comparison of Monomial

# graded lex ordering
function mycomp{C}(x::Monomial{C}, y::Monomial{C})
    degx = deg(x)
    degy = deg(y)
    if degx != degy
        degx - degy
    else
        i = j = 1
        # since they have the same degree,
        # if we get j > nvars(y), the rest in x.z should be zeros
        while i <= nvars(x) && j <= nvars(y)
            if x.vars[i] > y.vars[j]
                if x.z[i] == 0
                    i += 1
                else
                    return 1
                end
            elseif x.vars[i] < y.vars[j]
                if y.z[j] == 0
                    j += 1
                else
                    return -1
                end
            elseif x.z[i] != y.z[j]
                return x.z[i] - y.z[j]
            else
                i += 1
                j += 1
            end
        end
        0
    end
end

function (==){C}(x::Monomial{C}, y::Monomial{C})
    mycomp(x, y) == 0
end
(==){C}(x::PolyVar{C}, y::Monomial{C}) = Monomial{C}(x) == y

# graded lex ordering
function isless{C}(x::Monomial{C}, y::Monomial{C})
    mycomp(x, y) < 0
end
isless{C}(x::Monomial{C}, y::PolyVar{C}) = isless(x, Monomial{C}(y))
isless{C}(x::PolyVar{C}, y::Monomial{C}) = isless(Monomial{C}(x), y)

# Comparison of MonomialVector
function (==){C}(x::MonomialVector{C}, y::MonomialVector{C})
    if length(x.Z) != length(y.Z)
        return false
    end
    allvars, maps = myunion([_vars(x), _vars(y)])
    # Should be sorted in the same order since the non-common
    # polyvar should have exponent 0
    for (a, b) in zip(x.Z, y.Z)
        A = zeros(length(allvars))
        B = zeros(length(allvars))
        A[maps[1]] = a
        B[maps[2]] = b
        if A != B
            return false
        end
    end
    return true
end
(==)(mv::AbstractVector, x::MonomialVector) = sortmonovec(mv) == x
(==)(x::MonomialVector, mv::AbstractVector) = x == sortmonovec(mv)

# Comparison of Term
function (==){C}(p::Polynomial{C}, q::Polynomial{C})
    # terms should be sorted and without zeros
    if length(p) != length(q)
        return false
    end
    for i in 1:length(p)
        if p.x[i] != q.x[i]
            # There should not be zero terms
            @assert p.a[i] != 0
            @assert q.a[i] != 0
            return false
        end
        if p.a[i] != q.a[i]
            return false
        end
    end
    return true
end

function grlex(x::Vector{Int}, y::Vector{Int})
    @assert length(x) == length(y)
    degx = sum(x)
    degy = sum(y)
    if degx != degy
        degx < degy
    else
        for (a, b) in zip(x, y)
            if a < b
                return true
            elseif a > b
                return false
            end
        end
        false
    end
end

function isapprox{C, S, T}(p::Polynomial{C, S}, q::Polynomial{C, T}; rtol::Real=Base.rtoldefault(S, T), atol::Real=0, ztol::Real=1e-6)
    i = j = 1
    while i <= length(p.x) || j <= length(q.x)
        lhs, rhs = 0, 0
        if i > length(p.x) || (j <= length(q.x) && q.x[j] > p.x[i])
            if !isapproxzero(q.a[j], ztol=ztol)
                return false
            end
            j += 1
        elseif j > length(q.x) || p.x[i] > q.x[j]
            if !isapproxzero(p.a[i], ztol=ztol)
                return false
            end
            i += 1
        else
            if !isapprox(p.a[i], q.a[j], rtol=rtol, atol=atol)
                return false
            end
            i += 1
            j += 1
        end
    end
    true
end
