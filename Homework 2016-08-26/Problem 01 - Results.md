Numerical Analysis – (08-26-16)
===========

`Problem 01` – Davis Engeler

## Source Code [Swift 2.2]:

```swift
func newtonsMethod(threshold: Double, startingPn: Double) {
    var n = 1
    var difference = 0.0
    var lastPn = startingPn
    var Pn = startingPn

    print("| n | p_n | abs((p_n) - (p_n-1)) |")
    print("|---|---|---|");

    repeat {
        let numerator = (((lastPn*lastPn*lastPn) + (4*(lastPn*lastPn)) - 10))
        let denominator = (3 * (lastPn*lastPn) + (8 * lastPn))
        Pn = lastPn - (numerator/denominator)
        difference = abs(Pn - lastPn)
        lastPn = Pn
        print("| \(n) | `\(Pn)` | `\(difference)` |")
        n = n+1
    } while (difference >= threshold)

    print("\n###### Final Result: `\(Pn)`")
}

newtonsMethod(0.00001, startingPn: 2.0)
newtonsMethod(0.00001, startingPn: 1.5)
newtonsMethod(0.00001, startingPn: -100)
```

------------

Outputs
------------

### P<sub>0</sub> = `2.0`

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.5` | `0.5` |
| 2 | `1.37333333333333` | `0.126666666666667` |
| 3 | `1.36526201487463` | `0.00807131845870668` |
| 4 | `1.36523001391615` | `3.20009584799941e-05` |
| 5 | `1.3652300134141` | `5.02049735118248e-10` |

###### Final Result: `1.3652300134141`

------------

### P<sub>0</sub> = `1.5`

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `1.37333333333333` | `0.126666666666667` |
| 2 | `1.36526201487463` | `0.00807131845870668` |
| 3 | `1.36523001391615` | `3.20009584799941e-05` |
| 4 | `1.3652300134141` | `5.02049735118248e-10` |

###### Final Result: `1.3652300134141`

------------

### P<sub>0</sub> = `-100`

| n | p_n | abs((p_n) - (p_n-1)) |
|---|---|---|
| 1 | `-67.1229452054795` | `32.8770547945205` |
| 2 | `-45.2106915629508` | `21.9122536425286` |
| 3 | `-30.6110303374328` | `14.599661225518` |
| 4 | `-20.8903135326827` | `9.72071680475007` |
| 5 | `-14.4275998450254` | `6.46271368765734` |
| 6 | `-10.1439728120449` | `4.28362703298051` |
| 7 | `-7.32165066415818` | `2.82232214788669` |
| 8 | `-5.4823476696099` | `1.83930299454828` |
| 9 | `-4.30432816973223` | `1.17801949987767` |
| 10 | `-3.56482426133628` | `0.739503908395955` |
| 11 | `-3.09947818400959` | `0.465346077326685` |
| 12 | `-2.76430394502465` | `0.33517423898494` |
| 13 | `-2.07567447507642` | `0.688629469948237` |
| 14 | `-2.54011250424104` | `0.46443802916462` |
| 15 | `-3.14210776243406` | `0.601995258193028` |
| 16 | `-2.80067943523178` | `0.341428327202287` |
| 17 | `-2.27423777506438` | `0.526441660167398` |
| 18 | `-2.67540087079645` | `0.401163095732066` |
| 19 | `4.72553902845132` | `7.40093989924777` |
| 20 | `2.9616670019794` | `1.76387202647192` |
| 21 | `1.94054401797926` | `1.02112298400014` |
| 22 | `1.47933270627349` | `0.461211311705776` |
| 23 | `1.37111983389183` | `0.108212872381654` |
| 24 | `1.36524694701925` | `0.00587288687258325` |
| 25 | `1.36523001355467` | `1.69334645769847e-05` |
| 26 | `1.3652300134141` | `1.40575773244223e-10` |

###### Final Result: `1.3652300134141`
