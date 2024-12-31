//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

if let input = readLine()?.split(separator: " "), input.count == inputCase {
    let inputNumber = input.map{ Int($0) ?? 0}
    
    var dp: [Int] = Array(repeating: 0, count: inputCase)
    dp[0] = 1
    
    for i in 1..<inputCase{
        var count: Int = 0
        
        for j in 0..<i{
            if inputNumber[j] < inputNumber[i] {
                if count < dp[j] {
                    count = dp[j]
                }
            }
        }
        
        dp[i] = count + 1
    }
    print(dp.max() ?? 0)
}