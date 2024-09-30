import Foundation

let input = Int(readLine()!)!

if input >= 1 || input <= 10000 {
    var sum = 0
    for number in 1...input {
        sum += number
    }
    print(sum)
    
} else {
    exit(0)
}