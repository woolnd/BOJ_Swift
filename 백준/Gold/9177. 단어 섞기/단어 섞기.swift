//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

func check(_ a: [Character], _ b: [Character], _ c: [Character]) -> Bool {
    let n = a.count
    let m = b.count
    
    if n + m != c.count { return false }
    
    var dp = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
    dp[0][0] = true
    
    if n > 0 {
        for i in 1...n {
            dp[i][0] = dp[i-1][0] && (a[i - 1] == c[i - 1])
        }
    }
    
    if m > 0 {
        for j in 1...m {
            dp[0][j] = dp[0][j - 1] && (b[j - 1] == c[j - 1])
        }
    }
    
    if n > 0 && m > 0 {
        for i in 1...n {
            for j in 1...m {
                let ch = c[i + j - 1]
                dp[i][j] = (dp[i-1][j] && a[i-1] == ch) ||  (dp[i][j - 1] && b[j - 1] == ch)
            }
        }
    }
    
    return dp[n][m]
}

let n = Int(readLine()!)!

for i in 0..<n {
    let input = Array(readLine()!.split(separator: " "))
    let a = Array(input[0])
    let b = Array(input[1])
    let c = Array(input[2])
    
    let result = check(a, b, c)
    
    if result {
        print("Data set \(i+1): yes")
    } else {
        print("Data set \(i+1): no")
    }
}