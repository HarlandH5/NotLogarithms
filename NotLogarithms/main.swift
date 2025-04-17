//
//  main.swift
//  NotLogarithms
//
//  Created by Harland Harrison on 3/23/25.
//

import Foundation

// Largest integer accepted
let max = 999999

// Build the one-dimensional table
var notLogRA:[Int] = []

// Populate table to map n to n squared over 4
notLogRA.append(0) // f(0)
notLogRA.append(0) // f(1) OR 0.25
notLogRA.append(1) // f(2)

// Use only precise sums of integers with 0 error
for _ in 0...max {
    
// f(x) = x*x/4
// f(x+2) = (x+2)(x+2)/4 = f(x)+x+1
    
    notLogRA.append(0)
    notLogRA.append(0)
    let x = notLogRA.count-4
    notLogRA[x+2] = notLogRA[x] + x + 1   // odd, off by 0.25
    notLogRA[x+3] = notLogRA[x+1] + x + 2 // even
}

// Multiply by table look up
func multiply(_ x:Int,_ y:Int)-> Int {
    if y < 0 {
        return -multiply(-y,x)
    }
    if y>x {
        return multiply(y,x)
    }
    guard x+y <= 2*max else {
        print("Out of Range: \(x)+\(y)>\(2*max)")
        exit(1)
    }
    // Multiply x and y by table look up
    return notLogRA[x+y] - notLogRA[x-y]
}

// UI and testing
func multiplyTest(_ x:Int,_ y:Int) -> Int {
    guard abs(x)+abs(y) <= 2*max else {
        print("\n   ERROR: Out of Range! Absolute values must be < \(max)\n\n")
        return 0
    }
    // multiply by table look up & check result
    let result = multiply(x,y)
    if result != x*y {
        print("ERROR: \(result)\n SB \(x*y) = \(x)*\(y)")
    }
    return result
}

// Multiply Command Line arguments
func runCLIargs () -> Bool {
    var argRA:[Int] = []
    var total:Int = 0
    for argument in CommandLine.arguments {
        if let val = Int(argument){
            argRA.append(val)
        }
    }

    if argRA.count>0 {
        total = argRA[0]
    }
    print(total,terminator:"")
    if argRA.count<2 {
        print("   ERROR: Enter two or more integers\n\n")
        return false
    }
    for i in 1..<argRA.count {
        print("*\(argRA[i])",terminator:"")
        total = multiplyTest(argRA[i],total)
    }
    print("=\(total)")
    return true
}

// Run: multiply all command line arguments
if runCLIargs() {
    exit(0) // all done
}

// No valid arguments entered.  Explain usage
print("NotLogarithms -- multiply ints by flat table look ups")
print("Usage: NotLogarithms 999999 999999 [999999] ... \n")

print("Here are some samples:\n")
for _ in 0...5 {
    let x = Int.random(in: -max...max)
    let y = Int.random(in: -max...max)
    let z = multiplyTest(x,y)
    print("NotLogarithms \(x) \(y)")
    print("\(x)*\(y) = \(z)\n")
}
// Exit to try again
exit(0)
