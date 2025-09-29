//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let MOD = 1_000_000_009

if N == 1 || N == 2 {
    print(1)
} else if N == 3 {
    print(2)
} else {
    var dp = [Int](repeating: 0, count: N + 1)
    dp[1] = 1
    dp[2] = 1
    dp[3] = 2
    for i in 4...N {
        dp[i] = (dp[i - 1] + dp[i - 3]) % MOD
    }
    print(dp[N])
}