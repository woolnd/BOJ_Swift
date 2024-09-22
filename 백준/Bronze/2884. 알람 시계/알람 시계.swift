import Foundation

let numbers = readLine()!.split(separator: " ")

if Int(numbers[1]) ?? 0 >= 45 {
    let minute = (Int(numbers[1]) ?? 0) - 45
    print("\(Int(numbers[0]) ?? 0) \(minute)")
} else {
    if Int(numbers[0]) ?? 0 == 0 {
        let minute = (Int(numbers[1]) ?? 0) - 45 + 60
        print("23 \(minute)")
    } else {
        let hour = (Int(numbers[0]) ?? 0) - 1
        let minute = (Int(numbers[1]) ?? 0) - 45 + 60
        print("\(hour) \(minute)")
    }
}