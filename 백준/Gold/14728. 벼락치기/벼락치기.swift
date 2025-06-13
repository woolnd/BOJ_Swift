//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let T = Int(input[1])!

var list: [(Int, Int)] = []

for _ in 0..<N {
    let inputList = readLine()!.split(separator: " ")
    let a = Int(inputList[0])!
    let b = Int(inputList[1])!
    
    list.append((a, b))
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: T + 1), count: N + 1)

for i in 1...N {
    for j in 1...T {
        let time = list[i - 1].0
        let value = list[i - 1].1
        
        if time > j {
            dp[i][j] = dp[i - 1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i - 1][j - time] + value)
        }
    }
}

print(dp[N].max() ?? 0)