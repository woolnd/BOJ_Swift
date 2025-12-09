//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    dp[i] = input
}

for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            dp[i][j] += dp[i-1][j]
        } else if j == i {
            dp[i][j] += dp[i-1][j-1]
        } else {
            dp[i][j] += max(dp[i-1][j], dp[i-1][j-1])
        }
    }
}

print(dp[n-1].max()!)
