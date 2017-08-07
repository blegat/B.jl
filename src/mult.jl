function multiplyexistingvar{C}(v::Vector{PolyVar{C}}, x::PolyVar{C}, i::Int)
    updatez = z -> begin
        newz = copy(z)
        newz[i] += 1
        newz
    end
    # /!\ v not copied for efficiency, do not mess up with vars
    v, updatez
end
function insertvar{C}(v::Vector{PolyVar{C}}, x::PolyVar{C}, i::Int)
    n = length(v)
    I = 1:i-1
    J = i:n
    K = J+1
    w = Vector{PolyVar{C}}(n+1)
    w[I] = v[I]
    w[i] = x
    w[K] = v[J]
    updatez = z -> begin
        newz = Vector{Int}(n+1)
        newz[I] = z[I]
        newz[i] = 1
        newz[K] = z[J]
        newz
    end
    w, updatez
end

include("cmult.jl")
include("ncmult.jl")

MP.multconstant(α, x::Monomial)   = Term(α, x)
MP.multconstant(α, p::Polynomial) = Polynomial(α*p.a, p.x)
MP.multconstant(p::Polynomial, α) = Polynomial(p.a*α, p.x)

# I do not want to cast x to TermContainer because that would force the promotion of eltype(q) with Int
function *(x::Union{PolyVar, Monomial}, p::Polynomial)
    # /!\ No copy of a is done
    Polynomial(p.a, x*p.x)
end
function *(p::Polynomial, x::Union{PolyVar, Monomial})
    # /!\ No copy of a is done
    Polynomial(p.a, p.x*x)
end

function _term_poly_mult(t::Term, p::Polynomial, op::Function)
    if iszero(t)
        zero(p)
    else
        n = nterms(p)
        allvars, maps = myunion([t.x.vars, p.x.vars])
        nv = length(allvars)
        # Necessary to annotate the type in case it is empty
        Z = Vector{Int}[zeros(Int, nv) for i in 1:n]
        for i in 1:n
            Z[i][maps[1]] = t.x.z
            Z[i][maps[2]] += p.x.Z[i]
        end
        Polynomial(op(t.α, p.a), MonomialVector(allvars, Z))
    end
end
*(p::Polynomial, t::Term) = _term_poly_mult(t, p, (α, β) -> β * α)
*(t::Term, p::Polynomial) = _term_poly_mult(t, p, *)
function *(p::Polynomial, q::Polynomial)
    if iszero(p)
        zero(q)
    elseif iszero(q)
        zero(p)
    else
        samevars = vars(p) == vars(q)
        if samevars
            allvars = vars(p)
        else
            allvars, maps = myunion([vars(p), vars(q)])
        end
        N = length(p)*length(q)
        Z = Vector{Vector{Int}}(N)
        T = typeof(p.a[1]*q.a[1])
        a = Vector{T}(N)
        i = 0
        for u in p
            for v in q
                if samevars
                    z = u.x.z + v.x.z
                else
                    z = zeros(Int, length(allvars))
                    z[maps[1]] += u.x.z
                    z[maps[2]] += v.x.z
                end
                i += 1
                Z[i] = z
                a[i] = u.α * v.α
            end
        end
        polynomialclean(allvars, a, Z)
    end
end
