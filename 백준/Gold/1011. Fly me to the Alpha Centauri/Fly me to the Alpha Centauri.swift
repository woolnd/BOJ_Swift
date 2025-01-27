//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0
var results: [Int] = []

for _ in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == 2{
        let x = Int(input[0]) ?? 0
        let y = Int(input[1]) ?? 0
        
        let distance = y - x
        var n = 0
        
        while true{
            if distance <= n * (n + 1){
                break
            }
            n += 1
        }
        
        if distance <= n * n{
            results.append(n * 2 - 1)
        } else {
            results.append(n * 2)
        }
    }
}

for result in results {
    print(result)
}