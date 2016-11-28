Numerical Analysis – (10-11-16)
===========

`Problem 01-a` – Davis Engeler

## Source Code [Swift 3]:

```swift
//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.1, 0.1, 0.1]

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (cos(newX[1]*newX[2]) + 0.5) / 3.0
    newX[1] = sqrt(newX[0]*newX[0]+0.315)/25 - 0.03
    newX[2] = -pow(M_E,(-newX[0]*newX[1]))/20 - (10 * M_PI - 3)/60
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1

    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")

    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    }

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.000000001, startingX: startingX)

```


Output
------------


#### Fixed Point (Gauss Seidel):

| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |
|---|---|---|---|---|
| 1 | `0.499983333472222` | `6.61493044917874e-05` | `-0.523597121948157` | `0.399983333472222` |
| 2 | `0.499999999800063` | `6.65927514259673e-05` | `-0.52359711080723` | `1.66663278410306e-05` |
| 3 | `0.499999999797373` | `6.65927513543996e-05` | `-0.523597110807232` | `2.68973732175937e-12` |

###### Final Approx. X =  (`0.499999999797373`, `6.65927513543996e-05`, `-0.523597110807232`)


-----------------

`Problem 01-b` – Davis Engeler

## Source Code [Swift 3]:

```swift
//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.0, 0.0, 0.0]

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = (7.17+3*newX[1]*newX[1]+4*newX[2])/12
    newX[1] = (11.54+newX[2]-newX[0]*newX[0])/10
    newX[2] = (7.631-pow(newX[1],3))/7
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1

    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")

    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    }

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.00001, startingX: startingX)

```



Output
------------

#### Fixed Point (Gauss Seidel):

| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |
|---|---|---|---|---|
| 1 | `0.5975` | `1.118299375` | `0.890351725625301` | `1.118299375` |
| 2 | `1.20693228157311` | `1.0973666193322` | `0.901362329370921` | `0.0886329065731146` |
| 3 | `1.19900748409645` | `1.10037433824516` | `0.899805812813072` | `0.00792479747666119` |
| 4 | `1.20014119200481` | `1.09994669320663` | `0.900027642040392` | `0.00113370790835665` |
| 5 | `1.19997989598752` | `1.10000758912662` | `0.899996064468616` | `0.000161296017293422` |
| 6 | `1.20000286219024` | `1.09999891952038` | `0.900000560305308` | `2.29662027273481e-05` |
| 7 | `1.19999959250494` | `1.10000015382933` | `0.899999920228494` | `3.26968530495186e-06` |

###### Final Approx. X =  (`1.19999959250494`, `1.10000015382933`, `0.899999920228494`)

-----------------

`Problem 01-c` – Davis Engeler

## Source Code [Swift 3]:

```swift
//: Playground - noun: a place where people can play

import Cocoa
import Darwin

var startingX = [0.0, 0.0, 0.0]

// ================================
// Gauss-Seidel fixed-point method
// ================================

func GaussSeidelG(X: [Double]) -> [Double] {
    var newX = X
    newX[0] = 1-cos(newX[0]*newX[1]*newX[2])
    newX[1] = 1-pow((1.0-newX[0]),0.25)-0.5*pow(newX[2],2)
    newX[1] += 1.5*newX[2] // I had to split this up. Doing this in the line above said it was too complex.
    newX[2] = newX[0]*newX[0]+0.1*newX[1]*newX[1]-0.01*newX[1]+1
    return newX
}

func fixedPointMethodGaussSeidel(threshold: Double, startingX: [Double]) {
    var lastX = startingX
    var X = GaussSeidelG(X: startingX)
    var k = 1

    print("| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |")
    print("|---|---|---|---|---|");
    var difference: Double { return abs(X.max()! - lastX.max()!) }
    print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")

    while (difference > threshold) {
        lastX = X
        X = GaussSeidelG(X: X)
        k+=1
        print("| \(k) | `\(X[0])` | `\(X[1])` | `\(X[2])` | `\(difference)` |")
    }

    print("\n###### Final Approx. X =  (`\(X[0])`, `\(X[1])`, `\(X[2])`)")
}

// ===============================
// Run the methods and get output
// ===============================

print ("\n#### Fixed Point (Gauss Seidel):\n")
fixedPointMethodGaussSeidel(threshold: 0.00001, startingX: startingX)

```


Output
------------

#### Fixed Point (Gauss Seidel):

| k | (x^k)_1 | (x^k)_2 | (x^k)_3 | abs((X^k) - (X^{k-1})) |
|---|---|---|---|---|
| 1 | `0.0` | `0.0` | `1.0` | `1.0` |
| 2 | `0.0` | `1.0` | `1.09` | `0.0900000000000001` |
| 3 | `0.0` | `1.04095` | `1.09794819025` | `0.00794819024999982` |
| 4 | `0.0` | `1.04417717113837` | `1.09858882476127` | `0.000640634511270388` |
| 5 | `0.0` | `1.04443453419673` | `1.09864000428031` | `5.11795190365483e-05` |
| 6 | `0.0` | `1.04445507691794` | `1.09864409000079` | `4.08572048060662e-06` |

###### Final Approx. X =  (`0.0`, `1.04445507691794`, `1.09864409000079`)
