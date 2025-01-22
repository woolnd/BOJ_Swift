//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let stairsCount = Int(readLine() ?? "0") ?? 0

var stairs: [Int] = []

for _ in 0..<stairsCount {
    stairs.append(Int(readLine() ?? "0") ?? 0)
}

if stairs.count == 1{
    print(stairs[0])
    exit(0)
} else if stairs.count == 2{
    print(stairs[0] + stairs[1])
    exit(0)
}

var dp: [Int] = Array(repeating: 0, count: stairsCount)

dp[0] = stairs[0]
dp[1] = stairs[0] + stairs[1]
dp[2] = max(stairs[0] + stairs[2], stairs[1] + stairs[2])

for i in 3..<stairsCount {
    dp[i] = max(stairs[i] + stairs[i-1] + dp[i-3], stairs[i] + dp[i-2])
}

print(dp[stairsCount - 1])
