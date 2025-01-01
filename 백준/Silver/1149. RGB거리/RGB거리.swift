//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "0") ?? 0

var cost = [[Int]]()

for _ in 0..<input {
    if let input = readLine()?.split(separator: " ").map({ Int($0) ?? 0 }) {
            cost.append(input)
        }
}

var dp = Array(repeating: [0, 0, 0], count: input)
dp[0][0] = cost[0][0]
dp[0][1] = cost[0][1]
dp[0][2] = cost[0][2]

for i in 1..<input{
    dp[i][0] = cost[i][0] + min(dp[i-1][1], dp[i-1][2])
    dp[i][1] = cost[i][1] + min(dp[i-1][0], dp[i-1][2])
    dp[i][2] = cost[i][2] + min(dp[i-1][0], dp[i-1][1])
}

let result = min(dp[input-1][0], dp[input-1][1], dp[input-1][2])
print(result)