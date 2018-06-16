# Input-Output Refresher workshop
# Facilitated by Renato Vargas (renovargas@gmail.com)
# Module 01 - The building blocks of Input-Output analysis

# One way of creating a matrix
# We create a vector of length 6
help("c")
c <- c(2, 1, 3,  4, 6 ,12)

# Then we "fill" our matrix with it
help("matrix")
M <- matrix(c, nrow = 2, ncol = 3, byrow = TRUE)
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
# Similar to ordinary algebra, an identity matrix is one that leaves
# a matrix unchanged when the matrix is multiplied by it.

# If we have
# M =          [,1] [,2] [,3]
#         [1,]    2    1    3
#         [2,]    4    6   12

# By what matrix could M be postmultiplied so it remains unchanges.
# Hint: A matrix of ones is not a correct answer, because of the
# rules of matrix multiplication. The only answer is a diagonal of 1s.

I <- matrix( c(1, 0, 0,   0, 1, 0,  0, 0, 1), nrow = 3, ncol = 3, byrow = TRUE)

# Then we recall what M looks like
M

# And postmultiply M by I (remember matrix multiply symbol)
M %*% I

# The result is M, but what if M has dimensions in the thousands of
# and rows? We don't need to type it all. We get the dimensions of M
dim(M)

# > dim(M)
# [1] 2 3
# Then we know that our identity matrix has to be of dimensions 3 x 3.

I3 <-  diag(3)

# Let try a bigger one:
I10 <- diag(10)

# By which matrix should we "pre"-multiply M so that it remains the same.

I2 <- diag(2)

I2 %*% M

# 3. Matrix operations: Transposition

# Matrix operation with no parallel in ordinary algebra.
# Important in certain input-output operations.
# M', M prime, or M^t is an n x m matrix in which row i of M
# becomes column i of M^t

Mt <- t(M)

# In matrix algebra an n-element column vector is an n-element row vector.
# In R this is somewhat irrelevant as vectors are dimensionless and you can
# use them indistinctly in pre or post-multiplications. R uses the recycle
# rule. You can however force it into a Matrix if it eases your undestanding
# of the calculation.
t(c)
t( t(c) )

# Systems of linear equations 

# Say we have two linear equations with two unknowns x_1 and x_2

#     2x_1 +  x_2 = 10
#     5x_1 + 3x_2 = 26

# We can define A =      [,1] [,2]
#                   [1,]    2    1
#                   [2,]    5    3

# And define a column vector x containing the unknowns

#               x =       [,1] 
#                   [1,] "x_1"
#                   [2,] "x_2"

# and           b =      [,1]
#                   [1,]   10
#                   [2,]   26

# Then because of the way in which matrix multiplication and matrix equality
# are defined in matrix algebra, the equation system can be represented as:

#               Ax = b

# Then how do we find out what the vector of unknowns is? Matrix division...

# Let's put our known elements into R
A <- matrix(c(2,1,5,3), nrow = 2, ncol = 2, byrow = TRUE)
b <- matrix(c(10, 26), nrow = 2, ncol = 1, byrow = TRUE)

# In ordinary algebra, if we have something like:

#                      3x = 12

# We "solve" this equation by dividing by 3.
# In matrix algebra, we can't just divide using something like % / %

# In ordinary algebra we can also multiply both sides by the
# reciprocal of 3, which is (1/3) or 3^-1, so

#                   3x = 12  
#             (1/3) 3x = (1/3)  12
#       [ or (3^-1) 3x = (3^-1) 12 ]
#                 (1)x = 4
#                    x = 4

# We can use this concept with matrix algebra.


#                  Ax = b
#            (A^-1)Ax = (A^-1)b
#                  Ix = (A^-1)b    (I = identity matrix)
#                   x = A^-1 b 

# You might remember the tedious process of finding the determinant
# of a 2 x 2 square matrix by substracting cross products.
# We won't do this by hand, and let the computer do it.

# Use the solve() function to obtain the inverse of a matrix.

solve(A)

# Some matrices where cross-products are zero do not have inverses like:
C = matrix(c(2,4,6,12), nrow = 2, ncol = 2)
solve(C)

# It's the equivalent of trying to divide by zero in ordinary algebra.

# Going back to to our example: x = A^-1 b 
x = solve(A) %*% b
x
