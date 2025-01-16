//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

var numbers: [Int] = []

for _ in 0..<inputCase {
    numbers.append(Int(readLine() ?? "0") ?? 0)
}

print(Mean(numbers))
print(Median(numbers))
print(Mode(numbers))
print(Range(numbers))

func Mean(_ numbers: [Int]) -> Int {
    var sum: Double = 0
        
    for number in numbers{
        sum += Double(number)
    }
    
    let mean = sum / Double(numbers.count)
    
    return Int(round(mean))
}

func Median(_ numbers: [Int]) -> Int {
    let sortedNumbers = numbers.sorted()
    
    let mid = numbers.count / 2
    
    return sortedNumbers[Int(mid)]
}

func Mode(_ numbers: [Int]) -> Int {
    var frequency: [Int: Int] = [:]
    
    for number in numbers {
            frequency[number, default: 0] += 1
    }
    
    let sortedFrequency = frequency.sorted{
        if $0.value == $1.value {
            return $0.key < $1.key
        }
        return $0.value > $1.value
    }
    
    if sortedFrequency.count > 1 && sortedFrequency[0].value == sortedFrequency[1].value {
        return sortedFrequency[1].key
    }
    
    return sortedFrequency[0].key
}

func Range(_ numbers:[Int]) -> Int {
    let max = numbers.max() ?? 0
    let min = numbers.min() ?? 0
    
    return abs(max - min)
}