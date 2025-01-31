//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 2{
    let K = Int(inputCase[0]) ?? 0
    let N = Int(inputCase[1]) ?? 0
    
    var lines: [Int] = []
    
    for _ in 0..<K{
        lines.append(Int(readLine() ?? "0") ?? 0)
    }
    
    var start = 1
    var end = lines.max() ?? 0
    
    while start <= end{
        let mid = (start + end) / 2
        var count = 0
        
        for line in lines {
            count += line / mid
        }
        
        if count >= N{
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(end)
}