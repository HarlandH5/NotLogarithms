# NotLogarithms

A new way to multiply using a one-dimensional table which is perfectly accurate, and easy to build

## Overview

Once upon a time, long, long ago, there were no phones or computers.
People used logarithms, in tables or on slide rules, to multiply.
Just look up the logs and add,  then finally look up the answer.
Logarithms are so much easier than manual multiplication.  However,
logarithms are only approximate, and they took time to calculate.

So, here are NotLogarithms for multiplying with a flat table!
NotLogarithms are easy to calculate using only addition!
And NotLogarithms are perfectly accurate!

The NotLogarithms table maps x -> f(x)=(x^2)/4
By simple algebra, multiplication can be reduced to squaring,
adding, subtracting, and dividing by 4:

xy = ((x+y)^2-(x-y)^2)/4 = ((x^2+2xy+y^2)-(x^2-2xy+y^2))/4 = 4xy/4

To multiply with the NotLogarithms table, f(x)=(x^2)/4, use:

xy = f(x+y)-f(x-y)

Building the table of NotLogarithms is easy, using only addition: 

f(x) = x*x/4
f(x+2) = (x+2)(x+2)/4 = f(x)+x+1

Since f(1) = 0.25 floating point numbers appear necessary.
However, since the sum and difference will always be equal
in mod 2, f(1) and every odd f(2n+1) can be reduced by 0.25

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
