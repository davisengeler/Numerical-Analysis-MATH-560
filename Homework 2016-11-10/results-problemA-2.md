Numerical Analysis – (11-10-16)
===========

`Problem A-2` – Davis Engeler

## Source Code [Swift 3]:

```swift
import Cocoa
import Darwin

let n = 3
let startingX = [1.0, 1.0, 1.0]
let threshold = 0.00001

func F(X: [Double]) -> [Double] {
	var newX = X
	newX[0] = pow(X[0],2) + X[1] - 37.0
	newX[1] = X[0] - pow(X[1],2) - 5.0
	newX[2] = X[0] + X[1] + X[2] - 3.0
	return newX
}

// Gives the ij-th entry of the Jacobi matrix
func J(i: Int, j: Int, X: [Double]) -> Double {
	if (i == 0 && j == 0) { return 2*X[0] }
	if (i == 0 && j == 1) { return 1 }
	if (i == 0 && j == 2) { return 0 }
	if (i == 1 && j == 0) { return 1 }
	if (i == 1 && j == 1) { return -2*X[1] }
	if (i == 1 && j == 2) { return 0 }
	if (i == 2 && j == 0) { return 1 }
	if (i == 2 && j == 1) { return 1 }
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
| 1 | `15.9999994039536` | `5.99999970197678` | `-18.9999991059303` | `14.9999994039536` |
| 2 | `9.05194780213581` | `3.33766218460491` | `-9.38960998674072` | `9.61038911918961` |
| 3 | `6.46542605908038` | `1.88835990888547` | `-5.35378596796585` | `4.03582401877487` |
| 4 | `6.00058061383933` | `1.20911372292914` | `-4.20969433676847` | `1.14409163119738` |
| 5 | `5.99854351182206` | `1.01748059762193` | `-4.01602410944399` | `0.193670227324479` |
| 6 | `5.99998818683666` | `1.00014435564205` | `-4.00013254247871` | `0.0158915669652777` |
| 7 | `5.99999989558622` | `0.99999995821842` | `-3.99999985380464` | `0.000132688674065876` |
| 8 | `6.00000002089688` | `1.00000001044844` | `-4.00000003134532` | `1.25310654746465e-07` |

###### Final Approx. X =  (`6.00000002089688`, `1.00000001044844`, `-4.00000003134532`)