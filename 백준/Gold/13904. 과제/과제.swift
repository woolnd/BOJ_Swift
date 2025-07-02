//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var N = Int(readLine()!)!
var list: [(Int, Int)] = []

for _ in 0..<N {
    let input = Array(readLine()!.split(separator: " ").map{ Int(String($0)) })
    let deadLine = input[0]!
    let score = input[1]!
    
    list.append((deadLine, score))
}

list.sort { $0.0 < $1.0 }

var default_list = [Int]()

for (deadLine, score) in list {
    default_list.append(score)
    default_list.sort()
    
    if default_list.count > deadLine {
        default_list.removeFirst()
    }
}

let result = default_list.reduce(0, +)
print(result)