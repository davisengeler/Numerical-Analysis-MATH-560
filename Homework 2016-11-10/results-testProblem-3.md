Numerical Analysis – (11-10-16)
===========

`Test Problem 3` – Davis Engeler

## Source Code [Swift 3]:

```swift
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
| 1 | `0.499999958629818` | `-0.0165030060136745` | `-0.517348621770389` | `0.499999958629818` |
| 2 | `0.500014312008536` | `0.00165447031918593` | `-0.523237101657176` | `0.0181574763328604` |
| 3 | `0.500000166624919` | `2.02379505525468e-05` | `-0.523597047424418` | `1.41453836167063e-05` |
| 4 | `0.50000000005417` | `4.2585416092167e-07` | `-0.523598950405424` | `1.66570749422899e-07` |

###### Final Approx. X =  (`0.50000000005417`, `4.2585416092167e-07`, `-0.523598950405424`)