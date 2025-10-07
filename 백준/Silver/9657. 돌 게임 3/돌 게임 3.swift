//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var dp = Array(repeating: false, count: 1001)
dp[1] = true
dp[2] = false
dp[3] = true
dp[4] = true

if N >= 5 {
    for i in 5...N {
        dp[i] = (!dp[i-1]) || (!dp[i-3]) || (!dp[i-4])
    }
}

print(dp[N] ? "SK" : "CY")