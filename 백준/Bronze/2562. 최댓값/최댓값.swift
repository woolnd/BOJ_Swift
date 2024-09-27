import Foundation

var input: [Int] = []

for _ in 0..<9 {
    input.append(Int(readLine()!)!)
}

var maxNumber = input.max()!
var index = input.firstIndex(of: maxNumber)!

print(maxNumber)
print(index + 1)