//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let grapeCase = Int(readLine() ?? "0") ?? 0

var grapes: [Int] = []

for _ in 0..<grapeCase {
    grapes.append(Int(readLine() ?? "0") ?? 0)
}

if grapes.count == 1{
    print(grapes[0])
    exit(0)
} else if grapes.count == 2{
    print(grapes[0] + grapes[1])
    exit(0)
}
    
var dp: [Int] = Array(repeating: 0, count: grapeCase)
dp[0] = grapes[0]
dp[1] = grapes[0] + grapes[1]
dp[2] = max(grapes[0] + grapes[2], grapes[1] + grapes[2], dp[1])

for i in 3..<grapeCase {
    dp[i] = max(grapes[i] + grapes[i-1] + dp[i-3], grapes[i] + dp[i-2], dp[i-1])
}

print(dp[grapeCase - 1])