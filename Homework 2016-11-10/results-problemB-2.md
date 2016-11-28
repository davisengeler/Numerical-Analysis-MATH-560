Numerical Analysis – (11-10-16)
===========

`Problem B-2` – Davis Engeler

## Source Code [Swift 3]:

```swift
import Cocoa
import Darwin

let n = 3
let startingX = [0.0, 0.0, 0.0]
let threshold = 0.00001

func F(X: [Double]) -> [Double] {
	var newX = X
	newX[0] = X[0] + cos(X[0]*X[1]*X[2]) - 1.0
    newX[1] = sqrt(sqrt(1.0-X[0])) + X[1] + 0.05*pow(X[2],2.0) - 0.15*X[2] - 1.0
    newX[2] = -pow(X[0],2.0) + 0.1*pow(X[1],2.0) + 0.01*X[1] + X[2] - 1.0
	return newX
}

// Gives the ij-th entry of the Jacobi matrix
func J(i: Int, j: Int, X: [Double]) -> Double {
	if (i == 0 && j == 0) { return 1 }
	if (i == 0 && j == 1) { return -X[0]*X[2]*sin(X[0]*X[1]*X[2]) }
	if (i == 0 && j == 2) { return -X[0]*X[1]*sin(X[0]*X[1]*X[2]) }
	if (i == 1 && j == 0) { return -1 / 4*(sqrt(sqrt(1-3*X[0]+3*pow(X[0],2)-pow(X[0],3)))) }
	if (i == 1 && j == 1) { return 1 }
	if (i == 1 && j == 2) { return 0.1*X[2] - 0.15 }
	if (i == 2 && j == 0) { return -2*X[0] }
	if (i == 2 && j == 1) { return 0.2*X[1] + 0.01 }
	if (i == 2 && j == 2) { return 1 }
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
```


------------

Output
------------

| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | supnorm((X^k) - (X^{k-1})) |
|---|---|---|---|---|
| 1 | `0.0` | `0.149775` | `0.99850225` | `0.99850225` |
| 2 | `0.0` | `0.099912614072372` | `0.998251246567238` | `0.0` |

###### Final Approx. X =  (`0.0`, `0.099912614072372`, `0.998251246567238`)