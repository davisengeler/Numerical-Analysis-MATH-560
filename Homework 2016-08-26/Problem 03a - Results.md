Numerical Analysis – (08-26-16)
===========

`Problem 03a` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
import Darwin

func f(x: Double) -> Double {
    return ((2-pow(M_E,x)+pow(x,2))/3)-x
}

func fPrime(x: Double) -> Double {
    return (2*x-pow(M_E, x)-3)/3
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
newtonsMethod(0.00001, startingPn: 0.5)

print ("\n#### Secant Method:\n")
secantMethod(0.00001, startingPn: 0.5, nextPn: 0.4)
```

------------

Output
------------


#### Newton's Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `0.253688702418292` | `0.246311297581708` |
| 2 | `0.25752890079471` | `0.00384019837641847` |
| 3 | `0.257530285439682` | `1.38464497140278e-06` |

###### Final Result: `0.257530285439682`

#### Secant Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `0.255047788207072` | `0.244952211792928` |
| 2 | `0.257578685180889` | `0.00253089697381725` |
| 3 | `0.257530296682768` | `4.83884981217209e-05` |
| 4 | `0.25753028543981` | `1.12429576204498e-08` |

###### Final Result: `0.25753028543981`
