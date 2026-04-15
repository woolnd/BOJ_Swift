//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!

let n = Int(readLine()!)!
let inputN = readLine()!.split(separator: " ").map{ Int($0)! }

let m = Int(readLine()!)!
let inputM = readLine()!.split(separator: " ").map{ Int($0)! }


var sumN: [Int] = [inputN[0]]
var sumM: [Int] = [inputM[0]]

for i in 1..<n {
    var currentSum = 0
    currentSum += inputN[i] + sumN[i - 1]
    sumN.append(currentSum)
}

for i in 1..<m {
    var currentSum = 0
    currentSum += inputM[i] + sumM[i - 1]
    sumM.append(currentSum)
}

var subSumN: [Int] = []
var subSumM: [Int] = []

for i in 0..<n {
    for j in i..<n {
        let current: Int
        
        if i == 0 {
            current = sumN[j]
        } else {
            current = sumN[j] - sumN[i-1]
        }
        
        subSumN.append(current)
    }
}

for i in 0..<m {
    for j in i..<m {
        let current: Int
        
        if i == 0 {
            current = sumM[j]
        } else {
            current = sumM[j] - sumM[i-1]
        }
        
        subSumM.append(current)
    }
}

var countM: [Int: Int] = [:]
for sum in subSumM {
    countM[sum, default: 0] += 1
}

var ansewr = 0
for sum in subSumN {
    let target = T - sum
    
    if let count = countM[target] {
        ansewr += count
    }
}

print(ansewr)
