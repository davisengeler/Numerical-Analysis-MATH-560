Numerical Analysis – (11-10-16)
===========

`Problem C-2` – Davis Engeler

The intended starting point is `[15.0, -2.0]`, which doesn't find a solution.
The system has two solutions. Using starting point `[15.0, -1.0]` finds one.
I would say this is not accurate: we only find an estimation of one solution.

## Source Code [Swift 3]:

```swift
// The intended starting point is [15.0, -2.0], which doesn't find a solution.
// The system has two solutions. Using starting point [15.0, -1.0] finds one.

import Cocoa
import Darwin

let n = 2
let startingX = [15.0, -1.0]
let threshold = 0.00001

func F(X: [Double]) -> [Double] {
	var newX = X
	newX[0] = X[0] + pow(X[1],3) - 5*pow(X[1],2) - 2*X[1] - 10
	newX[1] = X[0] + pow(X[1],3) + pow(X[1],2) - 14*X[1] - 29
	return newX	
}

// Gives the ij-th entry of the Jacobi matrix
func J(i: Int, j: Int, X: [Double]) -> Double {
	if (i == 0 && j == 0) { return 1 }
	if (i == 0 && j == 1) { return 3*pow(X[1],2) - 10*X[1] - 2 }
	if (i == 1 && j == 0) { return 1 }
	if (i == 1 && j == 1) { return 3*pow(X[1],2) + 2*X[1] - 14 }
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

print("| k | (x^k)_1 | (x^k)_2 | supnorm((X^k) - (X^{k-1})) |")
print("|---|---|---|---|")

var X = startingX
var Y = [15.0,-1.0]
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
```


------------

Output
------------

| k | (x^k)_1 | (x^k)_2 | supnorm((X^k) - (X^{k-1})) |
|---|---|---|---|
| 1 | `14.4582800353744` | `-1.04167076650966` | `0.0416707665096592` |
| 2 | `14.4673275836717` | `-1.04124184249391` | `0.00904754829726565` |
| 3 | `14.4673286186537` | `-1.0412417922902` | `1.03498204441586e-06` |

###### Final Approx. X =  (`14.4673286186537`, `-1.0412417922902`)