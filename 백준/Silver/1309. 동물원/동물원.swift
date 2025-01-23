//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let lionCase = Int(readLine() ?? "0") ?? 0

if lionCase == 0 {
    print(1)
    exit(0)
}

var dp: [Int] = Array(repeating: 0, count: max(3, lionCase + 1))
dp[0] = 1
dp[1] = 3
dp[2] = 7

if lionCase == 1 {
    print(dp[1])
    exit(0)
} else if lionCase == 2 {
    print(dp[2])
    exit(0)
}

for i in 3...lionCase {
    dp[i] = (2 * dp[i-1] + dp[i-2]) % 9901
}

print(dp[lionCase])
