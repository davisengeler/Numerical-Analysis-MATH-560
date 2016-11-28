import Darwin

var lastW = 1.0			// Initial value
let degree = 4			// Degree of Taylor method
let partitions = 10		// Partitions of the interval
let a = 0.0				// Starting point of interval
let b = 1.0				// Ending point of interval

let h = (b-a)/Double(partitions)	// Calculate 'h'

func fac(x: Int) -> Double {
	return (x<=1) ? 1 : (Double(x) * fac(x: x-1))
}

func f(derivative: Int = 0, t: Double, w: Double) -> Double {
	if (derivative == 0) { return -w + t + 1 }
	return w*pow(-1.0, Double(derivative-1)) + t*pow(-1.0, Double(derivative))
}

func T(degree: Int, t: Double, w: Double) -> Double {
	var sum = 0.0
	for k in 1...degree { 
		sum += (pow(h,Double(k-1))/fac(x: k)) * f(derivative: (k-1), t: t, w: w) 
	}
	return sum
}

print("### `degree` = `\(degree)`\n")
print("| `i` | `w_i` | `y(t)` | `abs(w_i - y(t))`")
print("|---|---|---|---|")
for i in 0...partitions {
	let t = a + Double(i)*h
	let actual = Double(t)+pow(M_E,Double(-t))
	let difference = abs(lastW - actual)
	print("| `\(i)` | `\(lastW)` | `\(actual)` | `\(difference)` |")
	lastW = lastW + h*T(degree: degree, t: t, w: lastW)
}