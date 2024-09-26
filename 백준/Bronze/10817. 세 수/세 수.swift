import Foundation

var inputs = readLine()!.split(separator: " ")
var numbers: [Int] = []

for input in inputs {
    numbers.append(Int(input)!)
}

numbers.sort()
print(numbers[1])