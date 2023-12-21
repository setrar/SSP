####################################################
# Add convenient Math functions and function aliases
####################################################

# Transpose postfix operation
struct Transposer end
const ᵀ = Transposer() #typed \^T
Base.:(*)(x, ::Transposer) = transpose(x)

# Inverser postfix operation
struct Inverser end
const ⁻¹ = Inverser() #typed \^- \^1
Base.:(*)(x, ::Inverser) = inv(x)

# Conjugater postfix operation
struct Conjugater end
const ˣ = Conjugater() #typed \^x
Base.:(*)(x, ::Conjugater) = conj(x)

⦰ = reverse # https://en.wikipedia.org/wiki/APL_syntax_and_symbols#Monadic_functions
∑ = sum # Sum alias
argmax = findmax # Alias used for MLE search 