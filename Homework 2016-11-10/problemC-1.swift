import Cocoa
import Darwin

var startingX = [15.0, -2.0]

// ==========================
// Normal fixed-point method
// ==========================

func G(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = 2*newX[1] + 5*pow(newX[1],2) - pow(newX[1],3) + 10
    newX[1] = (1/14.0)*(newX[0] + pow(newX[1],3) + pow(newX[1],2) - 29)
    return newX
}

func fixedPointMethod(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = lastX
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 |  supnorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|");
    var difference: Double { return abs(abs(X.max()!) - abs(lastX.max()!)) }
    
    repeat {
        lastX = X
        X = G(X: X)
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
        k+=1
    } while (difference > threshold)

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")
}

// Run the methods and get output

print ("\n#### Fixed Point:\n")
fixedPointMethod(threshold: 0.00001, startingX: startingX)
