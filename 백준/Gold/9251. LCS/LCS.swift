//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let strA = readLine()!.map{ String($0) }
let strB = readLine()!.map{ String($0) }

var dp = Array(repeating: Array(repeating: 0, count: strB.count + 1), count: strA.count + 1)

for i in 1...strA.count {
    for j in 1...strB.count {
        if strA[i - 1] == strB[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}

print(dp[strA.count][strB.count])