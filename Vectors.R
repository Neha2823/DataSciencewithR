#Vectors
x <- c(2,0,0,4)
y <- c(1,9,9,9)
x+y

# Accessing vector elements
x <- c(2,3,2,8)
x[1] # select the first element
x[-1] # Exclude the first element
# position wise valuse and execute
x[1]<-3
x
x[-1]<-5
x
y<9 # Compare each elements
y[y<9]=2 # Edit elementsmarked as true in index vector
y

# Data frames
df<-data.frame(x=1:3,y=c("a","b","c"))
df
df[3,1] # Printing 3
df[1,2] # Printing a
df[2,c(1,2)] # Printing (2,b)
df[2,]
df[c(1,3),c(1,2)] # Printing (1,a) and (3,c)
df[c(1,3),2] # Printing (a and c )
data.frame(height = c (150,160),weight =c(65,72))
Df_new<data.frame(height = c (150,160),weight =c(65,72))
