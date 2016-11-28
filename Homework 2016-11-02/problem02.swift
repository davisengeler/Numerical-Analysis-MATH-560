import Cocoa
import Darwin

let n = 2
let startingX = [0.0, 0.0]
let threshold = 0.00001

func F(X: [Double]) -> [Double] {
	var newX = X
	newX[0] = pow(X[0],2.0) - 10*X[0] + pow(X[1],2.0) + 8
	newX[1] = X[0]*pow(X[1],2.0) + X[0] - 10*X[1] + 8
	return newX
}

// Gives the ij-th entry of the Jacobi matrix
func J(i: Int, j: Int, X: [Double]) -> Double {
	let h = pow(10.0,-10.0) // Get a really small value for h
	var offsetX = X
	offsetX[j] = offsetX[j] + h
	return ((F(X: offsetX)[i] - F(X: X)[i]) / h)
}

// Estimate Y: Jy=F(X)
func jacobiMethod(Y: [Double], X: [Double]) -> [Double] {
    var newY = Y
    for i in (0..<n) {
        var sum = 0.0
        for j in (0..<n) {
            if (j != i) {
                sum += (-J(i: i, j: j, X: X)*newY[j]) 
            }
        }
        newY[i] = (sum - F(X: X)[i]) / J(i: i, j: i, X: X)
    }
    return newY
}

print("| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |")
print("|---|---|---|---|");

var X = startingX
var Y = [0.0,0.0]
var lastY = Y
var k = 1
repeat {
	// Estimate Y: JY=F(X); [vector][matric] = [vector]
	repeat {
		lastY = Y
		Y = jacobiMethod(Y: Y, X: X)
	} while (abs(Y.max()! - lastY.max()!) > threshold)
	
	for i in (0..<n) {
		X[i] = X[i] + Y[i]
	}
	print("| \(k) | `\(X[0])` | `\(X[1])` | `\(abs(Y.max()!) )` |")
	k += 1
} while (abs(Y.max()!) > threshold)

print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")