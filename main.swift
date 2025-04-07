//
//  main.swift
//  NotLogarithms
//
//  Created by Harland Harrison on 3/23/25.
//

import Foundation

// build the one-dimensional table
let max = 999999
var RA:[Int] = []

// Table to map n to n squared over 4
RA.append(0)
RA.append(0) // OR 0.25
RA.append(1)
// Use only sums of integers with 0 error
for _ in 0...max {
    // f(x) = x*x/4
    // f(x+2) = (x+2)(x+2)/4 = f(x)+x+1
    RA.append(0)
    RA.append(0)
    let x = RA.count-4
    RA[x+2] = RA[x] + x + 1   // odd
    RA[x+3] = RA[x+1] + x + 2  // even
}

// Multiply by table look up
func multiply(_ x:Int,_ y:Int)-> Int {
    if y < 0 {
        return -multiply(-y,x)
    }
    if y>x {
        return multiply(y,x)
    }
    guard x+y < 2*max else {
        print("Out of Range")
        return 0
    }
    return RA[x+y] - RA[x-y]
}

func multiplyTest(_ x:Int,_ y:Int) -> Int {
    guard abs(x)+abs(y) < 2*max else {
        print("Out of Range! Numbers'absolute values must be < max")
        return 0
    }
    // multiply by table look up & check result
    let result = multiply(x,y)
    if result != x*y {
        print("ERROR: \(result)\n SB \(x*y) = \(x)*\(y)")
    }
    return Int(result)
}

// Multiply Command Line arguments
func runCLIargs () -> Bool {
    var RA:[Int] = []
    var total:Int = 0
    for argument in CommandLine.arguments {
        if let val = Int(argument){
            RA.append(val)
        }
    }

    if RA.count<1 {return false}
    total = RA[0]
    print(total,terminator:"")
    if RA.count==1 {
        print("   Enter at least two numbers")
        return false
    }
    for i in 1..<RA.count {
        print("*",terminator:"")
        print(RA[i],terminator:"")
        total = multiplyTest(RA[i],total)
    }
    print("=\(total)")
    return true
}

// Run
if runCLIargs() {
    exit(0) // all done
}

// No params.  Explain usage
print("NotLogarithms -- multiply ints by flat table look ups")
print("Usage: NotLogarithms [999] [999] ... \n")


print("\nHere are some samples:")
for _ in 0...3 {
    let lim = max-2
    let x = Int.random(in: -lim...lim)
    let y = Int.random(in: -lim...lim)
    let z = multiplyTest(x,y)
    print("\nNotLogarithms   \(x)   \(y)")
    print("\(x) * \(y) = \(z)")
}

exit(0)
