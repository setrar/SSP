module Tempo

import Distributions #: Rayleigh, Sampleable, Continuous, Univariate

# Export All
for n in names(@__MODULE__; all=true)
    if Base.isidentifier(n) && n ∉ (Symbol(@__MODULE__), :eval, :include)
        @eval export $n
    end
end

"""
https://discourse.julialang.org/t/implementing-a-custom-sampler-in-distributions-jl/41066
include("rayleigh.jl")
julia> using Random: seed!; seed!(42)
julia> splr = ScaledShiftedRayleighSampler(Rayleigh(), 3.0, 6.0)
julia> using Distributions
julia> splr = Tempo.ScaledShiftedRayleighSampler(Rayleigh(), 3.0, 6.0)
julia> rand(splr)
7.281532405238072

"""


struct ScaledShiftedRayleighSampler <: Distributions.Sampleable{Distributions.Univariate, Distributions.Continuous}
    distribution::Distributions.Rayleigh
    a::Float64
    b::Float64
end

function Base.rand(d::ScaledShiftedRayleighSampler)
    sample = rand(d.distribution)
    return sample * (d.b - d.a) + d.a
end

"""
https://github.com/JuliaStats/Distributions.jl/blob/master/src/univariate/continuous/rayleigh.jl
"""

function Distributions.mean(d::Distributions.Univariate)
    return 0
end

end
