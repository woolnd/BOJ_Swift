//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1]

var sections = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    sections[i] = input
}


var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

for i in 1...N {
    for j in 1...M {
        dp[i][j] = sections[i-1][j-1] + dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1]
    }
}

var maxSum = Int.min

// r1, c1: 네모의 왼쪽 위 (시작점)
for r1 in 1...N {
    for c1 in 1...M {
        
        // r2, c2: 네모의 오른쪽 아래 (끝점)
        for r2 in r1...N {
            for c2 in c1...M {
                
                // (r1, c1)부터 (r2, c2)까지의 부분행렬 합 구하기
                let currentSum = dp[r2][c2] - dp[r1 - 1][c2] - dp[r2][c1 - 1] + dp[r1 - 1][c1 - 1]
                
                if maxSum < currentSum {
                    maxSum = currentSum
                }
            }
        }
    }
}

print(maxSum)