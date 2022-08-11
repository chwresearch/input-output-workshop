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
ind <- c("сельское хозяйство", "Производство")
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

I <- diag(   dim(A)[1]    )
I

# We estimate our Leontief matrix
L <- solve( I - A )
L

# We check that the original x = Lf (Our model is calibrated!) 
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

Znew <- A %*% diag(xnew)  # error

# It gives us an error because the resulting xnew vector is defined
# as a matrix by R and the diag() function works differently if a
# matrix is passed to it.
help("diag")
help("as.vector")

Znew <- A %*% diag(c(xnew))
Znew <- A %*% diag(as.vector(xnew))
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

xrt <- 85

deltaf * xrt
deltax * xrt
deltaZ * xrt

# Environmental impacts or uses can be given by 
#vectors of coeficients by unit of output. For example, 
#let's imagine that the water use of each sector is given
#by the following vector for Agriculture and Manufactures. 

eprime <- t(as.matrix(c(300, 500)))
ind <- c("Agriculture", "Manufacturing")
rownames(eprime) <- "Cubic meters of water" # c("Agriculture", "Manufacturing")
colnames(eprime) <- ind
eprime

