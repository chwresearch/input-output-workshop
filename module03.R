# Input-Output Refresher workshop
# Facilitated by Renato Vargas (renovargas@gmail.com)
# Module 03 - What questions can we answer with the input-output model

# Output multipliers

# The output multiplier for sector j is defined as the total
# value of production in all sectors of the economy that is
# necessary in order to satisfy a dollar's worth of final
# demand for sector j's output.

# Simple output multipliers

# For the simple output multiplier, this total production
# is defined to be just the initial dollar's worth of sector
# j output needed to satisfy the additional final demand.
# The output multiplier is the ratio of the direct and indirect
# effect to the initial effect alone.

# From our running example.

A
L

# A=

#               [,1] [,2]
# Agriculture   0.15 0.25
# Manufacturing 0.20 0.05

# L=

#      Agriculture Manufacturing
# [1,]   1.2541254      0.330033
# [2,]   0.2640264      1.122112

# Consider the an additional dollar of demand for sector 1 only
deltaf1 <- c(1,0)
L %*% deltaf1

# or sector 2 only
deltaf2 <- c(0,1)
L %*% deltaf2

# We see in the first case, additionall outputs of $1.254 from
# sector 1 and $0.264 from sector 2. The 1.254 from sector 1
# represents $1.00 to satisfy the original new dollar of final
# plus an additional $0.254 for intra-industry use only. The 
# 0.264 from sector 2 is for intra and inter industry use only.

# The sector 1 multiplier is defined as the sum of the elements
# in the deltax(1) column ($1.518) divided by $1 (additional
# dollar) m(o)1= $1.518/$1= 1.518 which is dimensionless.

# So how do we do this for all sectors? With summation vectors.

# First we get the dimensions of L
dim(L)

# And then we create a summation vector of appropriate length.
help("rep")
i <- rep(1, dim(L)[1])

# So our multipliers are
mo <- i%*%L

