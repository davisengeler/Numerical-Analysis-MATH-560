//: Playground - noun: a place where people can play

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
