# Input-Output Refresher workshop
# Facilitated by Renato Vargas (renovargas@gmail.com)
# Module 01 - The building blocks of Input-Output analysis

# One way of creating a matrix
# We create a vector of length 6
help("c")
c <- c(2, 1, 3,  4, 6 ,12)

# Then we "fill" our matrix with it
help("matrix")
M <- matrix(M, nrow = 2, ncol = 3, byrow = TRUE)
# And we take a look at it
M

# Matrix operations
# 1. Addition and substraction

# Addition
# Let's add a second Matrix
N <- matrix(c(1,2,3,  3, 2, 1), nrow = 2, ncol = 3, byrow = TRUE)

S <- N + N
S

# Substraction
D = M - N
D

# Equality
# Matrices are equal if they have the same dimensions
# and if elements in corresponding positions are equal.

# Check dimensions of a matrix
dim(M)
dim(N)

# Check if elements correspond
M == N

# Check for equality
isTRUE(M == N)

# The null matrix
# The equivalent of zero in ordinary algebra
Z <- matrix(c(0,0,0,  0, 0, 0), nrow = 2, ncol = 3, byrow = TRUE)
Z <- matrix( 0, nrow = 2, ncol = 3, byrow = TRUE)

# 2. Multiplication
# Multiplication of a matrix by a number (scalar)
Mx2 <- M * 2

# Multiplication of a Matrix by another Matrix
# Unintuitive but completely logical according to notation

# Let's create a 3 x 3 matrix Q
Q = matrix(c(2,0,4,  1,1,2,  3,4,5), nrow = 3, ncol = 3, byrow = TRUE)

# The multiplication by hand

c( (2*2 + 1*1 + 3*3 ), (2*0 + 1*1 + 3*4 ), (2*4 + 1*2 + 3*5 ), #
   (4*2 + 6*1 + 12*3), (4*0 + 6*1 + 12*4), (4*4 + 6*2 + 12*5))

# Multiplication
P = M %*% Q


# The Identity Matrix
