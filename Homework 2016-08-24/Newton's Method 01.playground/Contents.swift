//: Playground - noun: a place where people can play

import Cocoa

var n = 1
let threshold = 0.00001
var lastPn = 0.73
var Pn = 0.0
var difference = 0.0

print("| n | p_n | abs((p_n) - (p_n-1)) |")
print("|---|---|---|");

repeat {
    let currentPn = Pn
    Pn = lastPn + ((cos(lastPn) - lastPn) / (sin(lastPn) + 1))
    lastPn = currentPn
    difference = abs(Pn - lastPn)
    print("| \(n) | `\(Pn)` | `\(difference)` |")
    n = n+1
} while (difference >= threshold)

print("\n###### Final Result: `\(Pn)`")
