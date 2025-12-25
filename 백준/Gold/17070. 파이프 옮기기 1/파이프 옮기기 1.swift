//
//  main.swift
//  BOJ 17070 - 파이프 옮기기 1
//
import Foundation

let N = Int(readLine()!)!
var house = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    house[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: N), count: N)

dp[0][1][0] = 1

for r in 0..<N {
    for c in 1..<N {

        if house[r][c] == 1 { continue }

        dp[r][c][0] += dp[r][c-1][0] + dp[r][c-1][2]

        if r > 0 && house[r-1][c] == 0 {
            dp[r][c][1] += dp[r-1][c][1] + dp[r-1][c][2]
        }

        if r > 0 && house[r-1][c] == 0 && house[r][c-1] == 0 {
            dp[r][c][2] += dp[r-1][c-1][0] + dp[r-1][c-1][1] + dp[r-1][c-1][2]
        }
    }
}

let answer = dp[N-1][N-1][0] + dp[N-1][N-1][1] + dp[N-1][N-1][2]
print(answer)