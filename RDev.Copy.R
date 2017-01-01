# https://www.dropbox.com/sh/02g1ixyawq6vizr/AAALiPN-G6bHQdHvDW-bdTEWa?dl=0
# What files are in this directory
list.files()

# Here set the working directory to the subfolder of the current
# working directory called LProj1
setwd("LProj1")
getwd()

# The assignment operator, i.e., (<-) alt + - to get <-

8 + 5 # Basic math; press cntl + enter

1:250 # To Print a set of numbers across multiple lines

# Variables
x <- 1:5 # Put the numbers 1 - 5 into variable x

# The vector catentate function  . . . 
y <- c(6, 7, 8, 9, 10) # Assigned to y

# Vector ... ing around 
# Here a 4-element vector created and assigned it to x
# To insert a new element '168' between third and fourth elements . . .
# string together the 1-3-elements of x, then the '168' then . . .
# the fourth element of x. This creates a new 5-element vector and
# assigning that new x-vector to x . . .
x <- c(88, 5, 12 ,13)
x <- c(x[1:3], 168, x[4])



# Google's R Style Guide
browseURL("https://google.github.io/styleguide/Rguide.xml")

# Clean up
rm(x) # Remove an object from workspace . . . here the object x
rm(a, b) # Remove more than one object from workspace
rm(list = ls()) # Clear the entire workspace


# Installing and managing packages

# LIST OF PACKAGES
browseURL("http://cran.r-project.org/web/views/") # Open CRAN task views
# Open "Available" Packages by Name
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")
# Also consider CRANtastic . . . has the most recent updates/additions
browseURL("http://crantastic.org/")

# See current packages
library() # Brings up editor list of installed packages . . . text based list
search() # Shows all packages currently loaded . . . in packages UI window

# TO INSTALL AND USE PACKAGES
# Can use menus: Tools > Install Packages . . . (or use Package)
# Or can use script, which can be saved and incorporate into source
install.packages("ggplot2") # Downloads packages from CRAN and install
library("ggplot2") # Make the package available; often used for loading in scripts
# Or
require("ggplot2") # The preferred function for loading in functions/package
library(help = "ggplot2") # Brings up documewntation in editor UI window

# VIGNETTES
vignette(package = "grid") # Brings up list of vignettes (examples)
# Or
browseVignettes(package = "grid") # Open web page with hyperlinks for PDFs etc.
vignette() # Brings up list of all vignettes for currently installed packages
browseVignettes() # Brings up HTML for all vignettes currently installed packages

# UPDATE PACKAGES
# In RStudio, Tools > Check for Packages Update . . . or go to Package Tab
update.packages() # Checks for updates . . .

# UNLOAD/REMOVE PACKAGES
# By default, all loaded packages are unloaded when R quits
# CAn also open Packages Tab window and . . . uncheck
# Or  . . . use code to unload packages
detach("package:ggplot2", unload = TRUE)

# Statistics Essential Training
# Using R's built-in datasets
# To see a list of the available datasets
data()

# To see the same list with clickable links and descriptions
browseURL("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html")
# Load a dataset from the package into the Workspace
data("airmiles") # Listed "ts" for "time-series"

# To see the structure of the dataset . . . here 'airmiles'
str(airmiles)
# Or . . . simply click on the name in the workspace UI

# CSV FILES
# No need to specifyu delimiters for missing data
# . . . by definition CSV is 'comma seprarated value'
pb.csv <- read.csv("~/somewhere/in R/Folder/pb.csv")

# Get marginal frequencies from original dataset/table
margin.table(UCBAdmissions, 1) # Admitted
margin.table(UCBAdmissions, 2) # Gender
margin.table(UCBAdmissions, 3) # Dept

# Save marginals as new table
admit.dept <- margin.table(UCBAdmissions, 3) # Dept
str(admit.dept)
barplot(admit.dept) # graphic view
admit.dept # Show frenquencies
prop.table(admit.dept) # Show as proportionals
round(prop.table(admit.dept), 2) # Show as proportions w/2 digits
round(prop.table(admit.dept), 2) * 100 # Show as percentages


# Go from or convert from table to 'one row per case'
admit1 <- as.data.frame(UCBAdmissions) # Coerces in to a data frame
# Using admit1 . . . into function . . . repeat each row by the value of Freq
admit2 <- lapply(admit1, function(x)rep(x, admit1$Freq)) # here goes from df to list
# Convert from list back to df . . .
admit3 <- as.data.frame(admit2) # Whereas admit3 is a new data frame
admit4 <- admit3[, -4] # Remove the 5th column . . . here freq
# Or . . .  admit1 thru admit4 in one step executionj
admit.rows <- as.data.frame(lapply(as.data.frame.table
(UCBAdmissions), function(x)rep(x, as.data.frame.table
(UCBAdmissions)$Freq)))[, -4] # This step is a universal just change the UCBAmissions
# add whatever file and change the column 'Freq' to remove from new data frame
str(admit.rows) 
admit.dept[1:10, ] # View first 10 rows of data w/ ',' and a blank

# From R In Action 2nd . . . code snippet 
require(scatterplot3d)
attach(mtcars)
s3d <- scatterplot3d(wt, disp, 
                     mpg, pch=16,
                     highlight.3d=TRUE,
                     type="h",
                     main = "3D Scatter Plot with Virtical Lines and Regression Plans")
fit <- lm(mgp - wt+disp)
s3d$plane3d(fit)