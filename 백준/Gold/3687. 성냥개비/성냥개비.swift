//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation


var dp = Array(repeating: Int64.max, count: 101)
dp[2] = 1
dp[3] = 7
dp[4] = 4
dp[5] = 2
dp[6] = 6
dp[7] = 8
dp[8] = 10

let minNums = [1, 7, 4, 2, 0, 8]
let minCounts = [2, 3, 4, 5, 6, 7]

for i in 8...100 {
    for j in 0..<minCounts.count {
        let count = minCounts[j]
        let addNum = minNums[j]
        
        if dp[i - count] != Int64.max {
            let newVal = dp[i - count] * 10 + Int64(addNum)
            dp[i] = min(newVal, dp[i])
        }
        
    }
}

func getMax(_ n: Int) -> String {
    var result = ""
    var count = n
    
    if count % 2 == 1{
        result += "7"
        count -= 3
    }
    
    while count > 0 {
        result += "1"
        count -= 2
    }
    
    return result
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = Int(readLine()!)!
    
    let minNum = dp[input]
    let maxNum = getMax(input)
    
    print("\(minNum) \(maxNum)")
}