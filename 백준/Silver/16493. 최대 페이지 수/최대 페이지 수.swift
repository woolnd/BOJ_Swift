//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1]

var day = [Int](repeating: 0, count: M + 1)
var page = [Int](repeating: 0, count: M + 1)

for i in 1...M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    day[i] = input[0]
    page[i] = input[1]
}

var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: M + 1)

for i in 1...M {
    for j in 1...N {
        if j >= day[i] {
            dp[i][j] = max(dp[i - 1][j], dp[i-1][j - day[i]] + page[i])
        } else {
            dp[i][j] = dp[i - 1][j]
        }
    }
}

print(dp[M][N])