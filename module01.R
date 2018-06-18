# Input-Output Refresher workshop
# Facilitated by Renato Vargas (renovargas@gmail.com)
# Module 01 - The building blocks of Input-Output analysis

# One way of creating a matrix
# We create a vector of length 6
help("c")
c <- c(2, 1, 3, 4, 6, 12)

# We can comment out the return for readability of our code.
c <- c(2, 1,  3, #
       4, 6, 12)

# Then we "fill out" our matrix with it
help("matrix")

M <- matrix(c, nrow = 2, ncol = 3, byrow = TRUE)
# And we take a look at it
M

# Check out the function as.matrix( ) too
help("as.matrix")

# Matrix operations
# 1. Addition and substraction

# Addition
# Let's add a second Matrix
N <- matrix( c(1,2,3,  3, 2, 1), nrow = 2, ncol = 3, byrow = TRUE)

# And add them (matrices have to have the same dimensions for addition)
dim(M)

dim(N)

S <- M + N

S

# What happens if they don't have the same dimensions

O = matrix( c(2,2,3,4), ncol = 2, nrow = 2, byrow = TRUE)

M+O


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

# You can pass a scalar to the matrix() function if you want all 
# cells to be the same.
Z <- matrix( 0, nrow = 2, ncol = 3, byrow = TRUE)

# 2. Multiplication
# Multiplication of a matrix by a number (scalar)
Mx2 <- M * 2

# Multiplication of a Matrix by another Matrix
# Unintuitive but completely logical according to notation

# If we have     P     =    M    x    Q
#             (m x n)    (m x r)   (r x n)

# in order to be conformable for multiplication the number 
# of columns in the matrix on the left must be the same as 
# the number of rows in the matrix on the right. 

# The definition of matrix multiplication also means that
# the product matrix, P, will have the same number of rows
# as M and the same number of columns as Q. 

# order of multiplication makes a difference. In this example,
# the product the other way around, QM, cannot even be found, 
# since there are three columns in Q but only two rows in M

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

# And postmultiply M by I (remember matrix multiply function)
M %*% I

# The result is M, but what if M has dimensions in the thousands of
# and rows? We don't need to type them all. We get the dimensions of M
dim(M)

# > dim(M)
# [1] 2 3
# Then we know that our identity matrix has to be of dimensions 3 x 3.
# Using the function diag()

help("diag")

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
# rule. You can however force a vector into a Matrix if it eases your 
# undestanding of the calculation.
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


# Diagonal matrices

# A useful notational device is available for creating a diagonal matrix
# from a vector. Then the "hat" version of an "x" vector is a diagonal
# matrix with the elements of x strung out along its main diagonal.

# For          x  =       [,1]
#                    [1,] "x1"
#                    [2,] "x2"
#                    [3,] "x3"

#   ^
#   x  [or xhat]  =      [,1] [,2] [,3]
#                    [1,] "x1" "0"  "0" 
#                    [2,] "0"  "x2" "0" 
#                    [3,] "0"  "0"  "x3"

# A hat is also used to denote a matrix formed from the diagonal of an
# existing matrix turning all off-diagonal elements to zero. And an
# inverse hat is used to denote the same matrix but with all of its
# diagonal elements turned to zero.

# For our Q matrix

#     Q =      [,1] [,2] [,3]
#         [1,]    2    0    4
#         [2,]    1    1    2
#         [3,]    3    4    5

#  Qhat =      [,1] [,2] [,3]
#         [1,]    2    0    0
#         [2,]    0    1    0
#         [3,]    0    0    5

Qhat <- diag(diag(Q))

# Quhat =      [,1] [,2] [,3]
#         [1,]    0    0    4
#         [2,]    1    0    2
#         [3,]    3    4    0

Quhat       <- Q
diag(Quhat) <- 0

# The inverse of a diagonal matrix is another diagonal matrix
# each of whose elements is just the reciprocal of the original
# element. For Qhat:

invQhat <- solve(Qhat)

# To check that this is the case, the result of multiplying both
# matrices should be an identity matrix.

invQhat %*% Qhat

# When a diagonal matrix, D, postmultiplies another 
# matrix, M, the jth element in D, dj, multiplies all of the
# elements in the jth column of M, and when a diagonal matrix
# premultiplies M, dj multiplies all of the elements in the 
# jth row of M.

# This is useful, for example, when we have coeficients per
# dollar of tonnes of pollution by industry.

# Summation vectors

# If M is postmultiplied by an n-element column vector of 1's
# the results will be an m-element column vector containing the
# row sums of M.

# If M is premultiplied by an m-element row vector of 1's, the
# result will be an n-elemnt row vector containing the column
# sums of M.

#   M =      [,1] [,2] [,3] Total
#       [1,]    2    1    3     6
#       [2,]    4    6   12    22
#            --------------
#     Total     6    7   15

# Row sums
M %*% matrix(1, ncol = 1, nrow = 3)

M %*% c(1,1,1)

# Column sums
matrix(1, ncol = 2, nrow = 1) %*% M

c(1,1) %*% M

# Cheat versions
colSums(M)
rowSums(M)

# Imagine using this when you have thousands of rows and columns.

