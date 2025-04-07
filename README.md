# NotLogarithms

A new way to multiply using a one-dimensional table which is perfectly accurate, and easy to build

## Overview

Once upon a time, long, long ago, there were no phones or computers.
People used logarithms, in tables or on slide rules, to multiply.
Just look up the logs and add,  then finally look up the answer.
Logarithms are so much easier than manual multiplication.  However,
ogarithms are only approximate, and they took time to calculate.

So, here are NotLogarithms for multiplying with a flat table!
NotLogarithms are easy to calculate using only addition!
And NotLogarithms are perfectly accurate!

The NotLogarithms table maps f(x) x -> f(x)=(x^2)/4
By simple algebra, multiplication can be reduced to squaring,
adding, subtracting, and dividing by 4:

xy = ((x+y)^2-(x-y)^2)/4 = ((x^2+2xy+y^2)-(x^2-2xy+y^2))/4

With the NotLogarithms table, f(x)=(x^2)/4, multiply by:

xy = f(x+y)-f(x-y)

## Author

NotLogarithms was written by 
Harland Harrison, (email: harlandh5@yahoo.fr)
 

## Running the Project

Run the Swift code in Terminal:
> cd [Your Directory]
> cd NotLogarithms/NotLogarithms/
> Swift main.swift 123 456 
> 123 X 456=56088

Build the project in XCode:
Select "Run" or "Build" in XCode
Then,in Terminal:
> cd [Your Directory]
> cd NotLogarithms/DerivedData/NotLogarithms/Build/Products/Debug/
> ./NotLogarithms 123 456
> 123 X 456=56088
