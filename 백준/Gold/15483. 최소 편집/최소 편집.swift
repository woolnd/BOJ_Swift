//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let A = Array(readLine()!)
let B = Array(readLine()!)

let n = A.count
let m = B.count

var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for i in 0...n { dp[i][0] = i }
for j in 0...m { dp[0][j] = j }

if n > 0 || m > 0 {
    for i in 1...n{
        for j in 1...m {
            if A[i - 1] == B[j - 1] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = min(dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1] + 1)
            }
        }
    }
}

let result = dp[n][m]
print(result)