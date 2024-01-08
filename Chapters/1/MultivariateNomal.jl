using LinearAlgebra
using Random

# Define a custom type for multivariate normal distribution
struct MultivariateNormal
    μ::Vector{Float64}
    Σ::Matrix{Float64}
end

# Constructor function to create a MultivariateNormal instance
function MvNormal(μ::Vector{Float64}, Σ::Matrix{Float64})
    # Validate that the mean and covariance have compatible sizes
    size(μ, 1) == size(Σ, 1) == size(Σ, 2) || throw(ArgumentError("Incompatible sizes for mean and covariance"))

    return MultivariateNormal(μ, Σ)
end

# PDF function for the multivariate normal distribution
function pdfᵦ(mvn::MultivariateNormal, x::Vector{Float64})
    # Validate that the input vector x has the same dimension as the mean
    size(mvn.μ, 1) == size(x, 1) || throw(ArgumentError("Incompatible sizes for mean and input vector"))

    d = size(x, 1)
    exponent = -0.5 * (x - mvn.μ)' * inv(mvn.Σ) * (x - mvn.μ)
    normalization = (2 * π)^(-d / 2) * det(mvn.Σ)^(-0.5)
    
    return normalization * exp(exponent)
end

# Example usage
μ = [1.0, 2.0]
Σ = [1.0 0.5; 0.5 1.0]

mvn = MvNormal(μ, Σ)

# Evaluate PDF for a specific point
point = [1.5, 2.5]
result = pdfᵦ(mvn, point)

println("PDF at $point: $result")
