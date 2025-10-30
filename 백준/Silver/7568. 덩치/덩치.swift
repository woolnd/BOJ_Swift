//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var list: [(Int, Int)] = []
var rank: [Int] = Array(repeating: 1, count: N)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    list.append((input[0], input[1]))
}

for i in 0..<N {
    let a = list[i]
    var count = 0
    for j in 0..<N {
        let b = list[j]
        
        if a.0 < b.0 && a.1 < b.1 {
            count += 1
        }
    }
    
    rank[i] += count
}

print(rank.map{ String($0) }.joined(separator: " "))