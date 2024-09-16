import Foundation


let numbers = readLine()!.split(separator: " ")
var sum: Int = 0

for number in numbers {
    sum += Int(number) ?? 0
}

print(sum)