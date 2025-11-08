//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

var dp = Array(repeating: 0, count: max(2, n) + 1)
dp[0] = 1
dp[1] = 1

if n >= 2 {
    for i in 2...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007   // 매 스텝 모듈로
    }
}

// 2xn 타일링의 정답은 dp[n]
print(dp[n] % 10007)
