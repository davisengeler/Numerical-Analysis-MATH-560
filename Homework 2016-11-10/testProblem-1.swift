//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.0, 0.0, 0.0]

// ==========================
// Normal fixed-point method
// ==========================

func G(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (cos(newX[1]*newX[2]) + 0.5) / 3.0
    newX[1] = (5/81.0)*(newX[0]*newX[0] + sin(newX[2]) + 1.06) - 5.0*(newX[1]*newX[1] + 0.01)
    newX[2] = ((10*M_PI - 3.0) / -60.0) + (pow(M_E,-newX[0]*newX[1]) / -20.0)
    return newX
}

func fixedPointMethod(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = lastX
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 |  supnorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    
    repeat {
        lastX = X
        X = G(X: X)
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
        k+=1
    } while (difference > threshold)

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`")
}

// Run the methods and get output

print ("\n#### Fixed Point:\n")
fixedPointMethod(threshold: 0.00001, startingX: startingX)
