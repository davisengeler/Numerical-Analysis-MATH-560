//: Playground - noun: a place where people can play

import Cocoa
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
