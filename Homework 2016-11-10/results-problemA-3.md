Numerical Analysis – (11-10-16)
===========

`Problem A-3` – Davis Engeler

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
| 1 | `15.9997494773641` | `5.99987494553298` | `-18.9996244228971` | `14.9997494773641` |
| 2 | `9.05181749735949` | `3.3375782883262` | `-9.38905435574156` | `9.61057006715556` |
| 3 | `6.46539261784107` | `1.88831493375662` | `-5.35370755156944` | `4.03534680417212` |
| 4 | `6.00057886908075` | `1.20909671930067` | `-4.20967558838142` | `1.14403196318802` |
| 5 | `5.99854293679983` | `1.01747739979064` | `-4.01602033659048` | `0.193655251790941` |
| 6 | `5.99998821310409` | `1.00014434878194` | `-4.00013256188603` | `0.0158877747044489` |
| 7 | `5.99999989587053` | `0.999999958048565` | `-3.99999985391909` | `0.000132707966940318` |
| 8 | `6.00000002089698` | `1.00000001044849` | `-4.00000003134547` | `1.25026451113887e-07` |

###### Final Approx. X =  (`6.00000002089698`, `1.00000001044849`, `-4.00000003134547`)
