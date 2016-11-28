Numerical Analysis – (08-26-16)
===========

`Problem 03b` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
import Darwin

func f(x: Double) -> Double {
    return pow(M_E,x)+(1/pow(2,x))+2*cos(x)-6
}

func fPrime(x: Double) -> Double {
    return pow(M_E,x)-(log(2)/pow(2,x))-2*sin(x)
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
secantMethod(0.00001, startingPn: 1.5, nextPn: 1.6)
```

------------

Output
------------



#### Newton's Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.95648972112421` | `0.45648972112421` |
| 2 | `1.84153306104206` | `0.11495666008215` |
| 3 | `1.82950601320365` | `0.0120270478384095` |
| 4 | `1.82938361449417` | `0.000122398709485161` |
| 5 | `1.82938360193385` | `1.25603170086919e-08` |

###### Final Result: `1.82938360193385`

#### Secant Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.91295803309444` | `0.412958033094439` |
| 2 | `1.80381779896306` | `0.109140234131381` |
| 3 | `1.8276391097894` | `0.0238213108263416` |
| 4 | `1.82942145034036` | `0.00178234055096094` |
| 5 | `1.82938354654104` | `3.79037993210041e-05` |
| 6 | `1.82938360193209` | `5.53910510792122e-08` |

###### Final Result: `1.82938360193209`
