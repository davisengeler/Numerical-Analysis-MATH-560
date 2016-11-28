import Cocoa
import Darwin

var startingX = [0.0,0.0,0.0]

func G(X: [Double], gaussSeidel: Bool) -> [Double] {
    var newX = X
    if (gaussSeidel) {
        newX[0] = (-3/4.0)*newX[1] + 6.0
        newX[1] = (-3/4)*newX[0] + (1/4)*newX[2] + 7.5
        newX[2] = (1/4)*newX[1] - 6.0
    } else {
        newX[0] = (-3/4.0)*X[1] + 6.0
        newX[1] = (-3/4)*X[0] + (1/4)*X[2] + 7.5
        newX[2] = (1/4)*X[1] - 6.0
    }
    return newX
}

func iterativeMethod(threshold: Double, startingX: [Double], gaussSeidel: Bool = true) 
{
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | supNorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|");

    var lastX = startingX
    var X = G(X: startingX, gaussSeidel: gaussSeidel)
    var k = 1

    var difference: Double { return abs(X.max()! - lastX.max()!) }
    
    repeat {
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
        lastX = X
        X = G(X: X, gaussSeidel: gaussSeidel)
        k+=1
    } while (difference > threshold)
}

// Run iterations

print ("\n#### Fixed Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: false)

print ("\n#### Gauss-Seidel Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: true)