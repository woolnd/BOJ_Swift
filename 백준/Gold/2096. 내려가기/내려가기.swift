//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    list[i] = input
}

var max_dp = Array(repeating: Array(repeating: 0, count: 3), count: N)
var min_dp = Array(repeating: Array(repeating: 0, count: 3), count: N)

var first = list[0]
max_dp[0] = first
min_dp[0] = first

for i in 1..<N {
    let prevMax = max_dp[i-1]
    let prevMin = min_dp[i-1]
    
    max_dp[i][0] = max(prevMax[0], prevMax[1]) + list[i][0]
    max_dp[i][1] = max(prevMax[0], prevMax[1], prevMax[2]) + list[i][1]
    max_dp[i][2] = max(prevMax[1], prevMax[2]) + list[i][2]
    
    min_dp[i][0] = min(prevMin[0], prevMin[1]) + list[i][0]
    min_dp[i][1] = min(prevMin[0], prevMin[1], prevMin[2]) + list[i][1]
    min_dp[i][2] = min(prevMin[1], prevMin[2]) + list[i][2]
}

print("\(max_dp[N-1].max()!) \(min_dp[N-1].min()!)")