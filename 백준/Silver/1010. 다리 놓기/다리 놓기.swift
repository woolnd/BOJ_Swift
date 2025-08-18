//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var list: [[Int]] = Array(repeating: Array(repeating: 0, count: 30), count: 30)

for i in 0..<30 {
    list[i][0] = i + 1
}

for i in 1..<30 {
    for j in 1..<30 {
        list[i][j] = list[i-1][j-1] + list[i-1][j]
    }
}

let inputCase = Int(readLine()!)!

for _ in 0..<inputCase {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    let N = input[0] - 1
    let M = input[1] - 1
    
    print(list[M][N])
}