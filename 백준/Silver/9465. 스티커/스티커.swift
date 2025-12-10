//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    
    var list = Array(repeating: [Int](), count: 2)
    
    for i in 0..<2 {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        
        list[i] = input
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: 3)
    
    for i in 1...n {
        dp[0][i] = list[0][i-1] + max(dp[1][i-1], dp[2][i-1])
        dp[1][i] = list[1][i-1] + max(dp[0][i-1], dp[2][i-1])
        dp[2][i] = max(dp[0][i-1], dp[1][i-1])
    }
    
    print(max(dp[0][n], dp[1][n], dp[2][n]))
}