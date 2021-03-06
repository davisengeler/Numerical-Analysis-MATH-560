//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.0, 0.0, 0.0]

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = 1-cos(newX[0]*newX[1]*newX[2])
    newX[1] = 1-pow((1.0-newX[0]),0.25)-0.5*pow(newX[2],2)
    newX[1] += 1.5*newX[2] // I had to split this up. Doing this in the line above said it was too complex.
    newX[2] = newX[0]*newX[0]+0.1*newX[1]*newX[1]-0.01*newX[1]+1
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    
    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    }
    
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.00001, startingX: startingX)
