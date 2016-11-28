//: Playground - noun: a place where people can play

import Cocoa

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