import Cocoa
import Darwin

var startingX = [0.0,0.0,0.0,0.0]

func G(X: [Double], gaussSeidel: Bool) -> [Double] {
    var newX = X
    if (gaussSeidel) {
        newX[0] = (1/10.0)*newX[1] + (-1/5.0)*newX[2] + (3/5.0)
        newX[1] = (1/11.0)*newX[0] + (1/11.0)*newX[2] + (-3/11.0)*newX[3] + (25/11.0)
        newX[2] = (-1/5.0)*newX[0] + (1/10.0)*newX[1] + (1/10.0)*newX[3] + (-11/10.0)
        newX[3] = (-3/8.0)*newX[1] + (1/8.0)*newX[2] + (15/8.0)
    } else {
        newX[0] = (1/10.0)*X[1] + (-1/5.0)*X[2] + (3/5.0)
        newX[1] = (1/11.0)*X[0] + (1/11.0)*X[2] + (-3/11.0)*X[3] + (25/11.0)
        newX[2] = (-1/5.0)*X[0] + (1/10.0)*X[1] + (1/10.0)*X[3] + (-11/10.0)
        newX[3] = (-3/8.0)*X[1] + (1/8.0)*X[2] + (15/8.0)
    }
    return newX
}

func iterativeMethod(threshold: Double, startingX: [Double], gaussSeidel: Bool = true) {
    var lastX = startingX
    var X = G(X: startingX, gaussSeidel: gaussSeidel)
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | (x^k)_4 | supNorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(X[3])` | `\(difference)` |")
    
    while (difference > threshold) {
        lastX = X
        X = G(X: X, gaussSeidel: gaussSeidel)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(X[3])` | `\(difference)` |")
    }
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`, `\(X[3])`)")
}

// Run iterations

print ("\n#### Fixed Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: false)

print ("\n#### Gauss-Seidel Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: true)