//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.1, 0.1]

// ==========================
// Normal fixed-point method
// ==========================

func G(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (pow(X[0],2)+pow(X[1],2) + 8) / 10
    newX[1] = (X[0]*pow(X[1],2) + X[0] + 8) / 10
    return newX
}

func fixedPointMethod(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = G(X: startingX)
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    
    while (difference > threshold) {
        lastX = X
        X = G(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    }
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")
}

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (pow(newX[0],2)+pow(newX[1],2) + 8) / 10
    newX[1] = (newX[0]*pow(newX[1],2) + newX[0] + 8) / 10
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    
    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    }
    
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point:\n")
fixedPointMethod(threshold: 0.00001, startingX: startingX)

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.00001, startingX: startingX)
