import Cocoa
import Darwin

let n = 3
let startingX = [0.0, 0.0, 0.0]
let threshold = 0.00001

func F(X: [Double]) -> [Double] {
	var newX = X
	newX[0] = 3.0*X[0] - cos(X[1]*X[2]) - 0.5
	newX[1] = X[0]*X[0] - 81.0*pow((X[1]+0.1),2) + sin(X[2]) + 1.06
	newX[2] = pow(M_E,(-X[0]*newX[1])) + 20.0*X[2] + (10.0*M_PI - 3)/3.0
	return newX
}

// Gives the ij-th entry of the Jacobi matrix
func J(i: Int, j: Int, X: [Double]) -> Double {
	if (i == 0 && j == 0) { return 3 }
	if (i == 0 && j == 1) { return X[2] * sin(X[1]*X[2]) }
	if (i == 0 && j == 2) { return X[1] * sin(X[1]*X[2]) }
	if (i == 1 && j == 0) { return 2*X[0] }
	if (i == 1 && j == 1) { return -162*(X[1]+0.1) }
	if (i == 1 && j == 2) { return cos(X[2]) }
	if (i == 2 && j == 0) { return -X[1]*pow(M_E,(-X[0]*X[1])) }
	if (i == 2 && j == 1) { return -X[0]*pow(M_E,(-X[0]*X[1])) }
	if (i == 2 && j == 2) { return 20 }
	return 0
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

print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | supnorm((X^k) - (X^{k-1})) |")
print("|---|---|---|---|---|")

var X = startingX
var Y = [0.0,0.0,0.0]
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
	print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(abs(Y.max()!) )` |")
	k += 1
} while (abs(Y.max()!) > threshold)

print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")