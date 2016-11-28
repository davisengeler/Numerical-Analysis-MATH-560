Numerical Analysis – (08-26-16)
===========

`Problem 02` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
func f(x: Double) -> Double {
    return pow(x,3) - x - 1
}

func fPrime(x: Double) -> Double {
    return (3 * pow(x,2)) - 1
}

func newtonsMethod(threshold: Double, startingPn: Double) {
    var n = 1
    var lastPn = startingPn
    var Pn = 0.0
    var difference = 0.0

    print("| n | p_n | abs((p_n) - (p_n-1)) |")
    print("|---|---|---|");

    repeat {
        let numerator = f(lastPn)
        let denominator = fPrime(lastPn)
        Pn = lastPn - (numerator/denominator)
        difference = abs(Pn - lastPn)
        lastPn = Pn
        print("| \(n) | `\(Pn)` | `\(difference)` |")
        n = n+1
    } while (difference >= threshold)

    print("\n###### Final Result: `\(Pn)`")
}

func secantMethod(threshold: Double, startingPn: Double, nextPn: Double) {
    var n = 1
    var difference = 0.0
    var PnMinusTwo = nextPn
    var PnMinusOne = startingPn
    var Pn = startingPn

    print("| n | p_n | abs((p_n) - (p_n-1)) |")
    print("|---|---|---|");

    repeat {
        let numerator = f(PnMinusOne) * (PnMinusOne - PnMinusTwo)
        let denominator = f(PnMinusOne)-f(PnMinusTwo)
        Pn = PnMinusOne - (numerator/denominator)
        difference = abs(Pn - PnMinusOne)
        PnMinusTwo = PnMinusOne
        PnMinusOne = Pn
        print("| \(n) | `\(Pn)` | `\(difference)` |")
        n = n+1
    } while (difference >= threshold)

    print("\n###### Final Result: `\(Pn)`")
}


print ("\n#### Newton's Method:\n")
newtonsMethod(0.00001, startingPn: 1.5)

print ("\n#### Secant Method:\n")
secantMethod(0.00001, startingPn: 1.5, nextPn: 1.4)

```

------------

Output
------------


#### Newton's Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.34782608695652` | `0.152173913043478` |
| 2 | `1.32520039895091` | `0.0226256880056148` |
| 3 | `1.32471817399905` | `0.000482224951853238` |
| 4 | `1.32471795724479` | `2.16754263870911e-07` |

###### Final Result: `1.32471795724479`

#### Secant Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.33521657250471` | `0.164783427495292` |
| 2 | `1.3262381627083` | `0.0089784097964094` |
| 3 | `1.32473270950887` | `0.00150545319942963` |
| 4 | `1.32471797812187` | `1.47313869987009e-05` |
| 5 | `1.32471795724503` | `2.08768373699542e-08` |

###### Final Result: `1.32471795724503`
