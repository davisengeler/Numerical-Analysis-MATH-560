Numerical Analysis – (09-14-16)
===========

`Problem 01` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
import Cocoa
import Darwin

func g(x: Double) -> Double {
    return M_PI + 0.5 * sin(x)
}

func fixedPointMethod(threshold: Double, startingPn: Double) {
    var lastPn = startingPn
    var Pn = g(startingPn)
    var n = 0;

    print("| n | p_n | abs((p_n) - (p_n-1)) |")
    print("|---|---|---|");
    var difference: Double { return abs(Pn - lastPn) }

    while (difference > threshold) {
        lastPn = Pn
        Pn = g(Pn)
        n+=1
        print("| \(n) | `\(Pn)` | `\(difference)` |")
    }
    print("\n###### Final Result: `\(Pn)`")
}

print ("\n#### Secant Method:\n")
fixedPointMethod(0.01, startingPn: 0.25)
```


------------

Output
------------

#### Fixed Point Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.91295803309444` | `0.412958033094439` |
| 2 | `1.80381779896306` | `0.109140234131381` |
| 3 | `1.8276391097894` | `0.0238213108263416` |
| 4 | `1.82942145034036` | `0.00178234055096094` |
| 5 | `1.82938354654104` | `3.79037993210041e-05` |
| 6 | `1.82938360193209` | `5.53910510792122e-08` |

###### Final Result: `1.82938360193209`
