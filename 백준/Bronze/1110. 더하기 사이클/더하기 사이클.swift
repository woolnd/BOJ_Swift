import Foundation

let input = Int(readLine()!)!
var number = input
var cycle: Int = 0

repeat {
    var sum = 0
    if number < 10 {
        sum = number
        number = number * 10 + sum
    } else {
        sum = number / 10 + number % 10
        if sum < 10 {
            number = (number % 10 * 10) + sum
        } else {
            number = (number % 10 * 10) + (sum % 10)
        }
    }
    cycle += 1
} while input != number

print(cycle)