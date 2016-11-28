// Define the setup

let n = 3 // dimension of X
var startingX = [0.0,0.0,0.0]
let B = [24.0,30.0,-24.0]
let A = [[4.0, 3.0, 0.0],
         [3.0, 4.0,-1.0],
         [0.0,-1.0, 4.0]]

// Define the functions
// Here we are using the Jacobi method

func G(X: [Double], gaussSeidel: Bool) -> [Double] {
    var newX = X
    for i in (0..<n) {
        var sum = 0.0
        for j in (0..<n) {
            if (j != i) {
                sum += (-A[i][j]*(gaussSeidel ? newX[j] : X[j])) 
                // print("\nFor i=\(i) and j=\(j): ((\(-A[i][j])*\(X[j]) + \(B[i])) / \(A[i][i]) = \((-1*A[i][j]*X[i] + B[i]) / A[i][i])\n")
            }
        }
        newX[i] = (sum +  B[i]) / A[i][i]
        // print("Total: \(newX[i])")
        // print("\n\(newX)\n\n")
    }
    return newX
}

func iterativeMethod(threshold: Double, startingX: [Double], gaussSeidel: Bool = true) {
    var lastX = startingX
    var X = G(X: startingX, gaussSeidel: gaussSeidel)
    var k = 1
    
    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | supNorm((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `X` | `\(difference)` |")
    
    repeat {
        lastX = X
        X = G(X: X, gaussSeidel: gaussSeidel)
        k+=1
        // print("\n\n=========================\n\n")
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    } while (difference > threshold) 
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: false)

print ("\n#### Gauss-Seidel Point:\n")
iterativeMethod( threshold: 0.00001, startingX: startingX, gaussSeidel: true)