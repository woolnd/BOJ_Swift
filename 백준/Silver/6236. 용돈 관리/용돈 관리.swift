//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 2{
    let N = Int(inputCase[0]) ?? 0
    let M = Int(inputCase[1]) ?? 0
    
    var bankBook: [Int] = []
    
    for _ in 0..<N{
        bankBook.append(Int(readLine() ?? "0") ?? 0)
    }
    
    var start = bankBook.max() ?? 0
    var end = bankBook.reduce(0, +)
    var result = end
    
    while start <= end {
        let mid = (start + end) / 2
        var remainder = mid
        var count = 1
        
        for money in bankBook{
            if remainder < money {
                count += 1
                remainder = mid
            }
            remainder -= money
        }
        
        if count > M{
            start = mid + 1
        } else {
            result = mid
            end = mid - 1
        }
    }

    print(result)
}