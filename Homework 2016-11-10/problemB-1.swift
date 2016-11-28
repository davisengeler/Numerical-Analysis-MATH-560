//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.0, 0.0, 0.0]

// ==========================
// Normal fixed-point method
// ==========================

func G(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = 1.0 - cos(X[0]*X[1]*X[2])
    newX[1] = -sqrt(sqrt(1-X[0])) - 0.05*pow(X[2],2.0) + 0.15*X[2] + 1.0
    newX[2] = -(pow(X[0],2.0) + 0.1*pow(X[1],2.0) + 0.01*X[1] - 1.0)
    return newX
}

func fixedPointMethod(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = lastX
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 |  supnorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(abs(X.max()!) - abs(lastX.max()!)) }
    
    repeat {
        lastX = X
        X = G(X: X)
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
        k+=1
    } while (difference > threshold)

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// Run the methods and get output

print ("\n#### Fixed Point:\n")
fixedPointMethod(threshold: 0.00001, startingX: startingX)
