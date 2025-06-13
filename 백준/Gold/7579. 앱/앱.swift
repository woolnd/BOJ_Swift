//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!


var inputMemory = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var inputCost = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var totalCost = inputCost.reduce(0, +)

var dp: [Int] = Array(repeating: 0, count: totalCost + 1)

for i in 0..<N {
    for j in stride(from: totalCost, through: inputCost[i], by: -1) {
        dp[j] = max(dp[j], dp[j - inputCost[i]] + inputMemory[i])
    }
}

for cost in 0...totalCost {
    if dp[cost] >= M {
        print(cost)
        break
    }
}