# Input-Output Refresher workshop
# Facilitated by Renato Vargas (renovargas@gmail.com)
# Module 02 - The Input-Output model


#             To processing sectors
#                  Agr   Manuf  FinDem  Total Output
# From
#   Agriculture    150     500     350          1000
#   Manufacturing  200     100    1700          2000
# 
# Payments sector  650    1400    1100          3150
# Total outlays   1000    2000    3150          6150 


# Technical coefficients (the A Matrix) 

#             To processing sectors
#                   Agr   Manuf  
# From
#   Agriculture    0.15    0.25
#   Manufacturing  0.20    0.05

# First we create our Input-Output table of interindustry
# flow of goods
Z <- matrix(c(150,500,200,100), nrow = 2, ncol = 2, byrow = TRUE)
ind <- c("Agriculture", "Manufacturing")
colnames(Z) <- ind 
rownames(Z) <- ind

# Our vector of total output needed from each sector
x <- c(1000, 2000)
x

# Our vector of final demand 
f <- c(350, 1700)
f

# A diagonal matrix with the total output by sector
xhat <- diag(x)
xhat

#  Our technical coefficients (input-output) table.
A <- Z %*% solve( xhat )
A

# We need to know the dimensions of A
dim(A)

# We use the number of rows to create an appropriate identity matrix

I <- diag(dim(A)[1])

# We estimate our Leontief matrix
L <- solve( I - A )
L

L %*% f

# What would happen if we changed our final demand?

# If final demand for agriculture output were to increase to $600
# next year and that for manufactures were to decrease to $1500,
# how much total output from the two sectors would be necesary in
# order to meet this new demand?

fnew <- c(600, 1500)

xnew <- L %*% fnew
xnew

# From the def of coefficients Z= A %*% xhat we find Znew

Znew = A %*% diag(xnew)  # error

# It gives us an error because the resulting xnew vector is defined
# as a matrix by R and the diag() function works differently if a
# matrix is passed to it.
help("diag")
help("as.vector")

Znew = A %*% diag(as.vector(xnew))
Znew

# So our new table

#             To processing sectors
#                    Agr    Manuf  FinDem  Total Output
# From
#  Agriculture    187.13   460.40     600       1247.52
#  Manufacturing  249.51    92.08    1500       1841.58  
# 
# Payments sector 810.89  1289.11    1100       3200.00
# Total outlays  1247.53  1841.58    3200       6289.10

# Sometimes we want to find out about changes in demands
# instead of levels.

# Changes in demand
deltaf <- fnew - f

# Changes in output
deltax <- xnew - x

# Changes in all inputs-outputs table
deltaZ <- Znew - Z

# In pounds. Exchange rate 0.754796 GBP for 1 USD

xrt <- 0.754796

deltaf * xrt
deltax * xrt
deltaZ * xrt


# Other impacts can be derived as coefficients from our model

eprime <- c(300, 500)

# This only works because of the recycle rule in r and 
# vectors being dimensionless
epsilon <- eprime / x

# In matrix algebra you would have to transpose e and 
# postmultiply it by a diagonal version of x
epsilon <- t(as.matrix(eprime)) %*% solve(diag(x))

# Epsilon is your vector of employment coefficients.

# enewi then your new vector of employment levels
enew <- diag(c(epsilon)) %*% L %*% fnew

# Suppose we have two types of disaggregations: male and female
Prnames <- c("male", "female")

P <- matrix(c(0.6, 0.4, 0.8, 0.2), nrow = 2, ncol = 2) # note byrow = FALSE
rownames(P) <- Prnames

# Then expenditures in employment by occupation by sector would be:

Pepsilon <- P %*% diag(c(epsilon)) %*% L %*% fnew
colnames(Pepsilon) <- c("Employment expend.")
Pepsilon


