Numerical Analysis – (09-13-16)
===========

`Problem 02` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
import Cocoa
import Darwin

func g(x: Double) -> Double {
    return sqrt(pow(M_E,x)/3)
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
fixedPointMethod(0.01, startingPn: 0.5)
```


------------

Output
------------

#### Secant Method:

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `0.836407006618305` | `0.0950745866473162` |
| 2 | `0.877127740480283` | `0.0407207338619779` |
| 3 | `0.895169427553643` | `0.0180416870733596` |
| 4 | `0.903281143149109` | `0.00811171559546642` |

###### Final Result: `0.903281143149109`
