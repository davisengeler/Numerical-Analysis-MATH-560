Numerical Analysis – (09-30-16)
===========

`Problem 02` – Davis Engeler

## Source Code [Swift 3.0]:

```swift
//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.1, 0.1]

// ==========================
// Normal fixed-point method
// ==========================

func G(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (pow(X[0],2)+pow(X[1],2) + 8) / 10
    newX[1] = (X[0]*pow(X[1],2) + X[0] + 8) / 10
    return newX
}

func fixedPointMethod(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = G(X: startingX)
    var k = 1

    print("| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")

    while (difference > threshold) {
        lastX = X
        X = G(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    }
    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")
}

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (pow(newX[0],2)+pow(newX[1],2) + 8) / 10
    newX[1] = (newX[0]*pow(newX[1],2) + newX[0] + 8) / 10
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1

    print("| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")

    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(difference)` |")
    }

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point:\n")
fixedPointMethod(threshold: 0.00001, startingX: startingX)

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.00001, startingX: startingX)
```


------------

Output
------------


#### Fixed Point:

| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |
|---|---|---|
| 1 | `0.802` | `0.8101` | `0.7101` |
| 2 | `0.929946601` | `0.932832213202` | `0.122732213202` |
| 3 | `0.97349766186988` | `0.973916375680332` | `0.0410841624783315` |
| 4 | `0.989621080448443` | `0.989687295361044` | `0.0157709196807128` |
| 5 | `0.9958830825467` | `0.995893606914198` | `0.0062063115531541` |
| 6 | `0.998358719039529` | `0.998360398332733` | `0.00246679141853456` |
| 7 | `0.999344361684134` | `0.99934463007199` | `0.000984231739257546` |
| 8 | `0.999737884288359` | `0.999737927211166` | `0.000393297139175686` |
| 9 | `0.999895176038584` | `0.999895182904999` | `0.000157255693832403` |
| 10 | `0.999958073986185` | `0.999958075084732` | `6.28921797337645e-05` |
| 11 | `0.999983230165732` | `0.999983230341495` | `2.51552567626101e-05` |
| 12 | `0.99999329215769` | `0.999993292185812` | `1.00618443170664e-05` |
| 13 | `0.999997316877699` | `0.999997316882199` | `4.02469638682845e-06` |

###### Final Approx. X =  (`0.999997316877699`, `0.999997316882199`)

#### Fixed Point (Gauss Seidel):

| k | (x^k)_1 | (x^k)_2 | abs((X^k) - (X^{k-1})) |
|---|---|---|---|---|
| 1 | `0.802` | `0.881002` | `0.781002` |
| 2 | `0.9419368524004` | `0.967303482108558` | `0.0863014821085584` |
| 3 | `0.982292106040931` | `0.990139928068298` | `0.0228364459597398` |
| 4 | `0.994527485874542` | `0.996953943562663` | `0.006814015494365` |
| 5 | `0.998300208574508` | `0.999052792228394` | `0.00209884866573129` |
| 6 | `0.999470978809926` | `0.999704944099053` | `0.000652151870658479` |
| 7 | `0.999835221273936` | `0.999908051502749` | `0.000203107403696001` |
| 8 | `0.999948658115992` | `0.999971343713319` | `6.32922105704425e-05` |
| 9 | `0.999984000711579` | `0.999991069058793` | `1.97253454734536e-05` |
| 10 | `0.999995013987648` | `0.99999721662617` | `6.14756737749023e-06` |

###### Final Approx. X =  (`0.999995013987648`, `0.99999721662617`)
