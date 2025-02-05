//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

var papers: [[Int]] = Array(repeating: Array(repeating: 0, count: inputCase), count: inputCase)

for i in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == inputCase {
        for j in 0..<inputCase {
            papers[i][j] = Int(input[j]) ?? 0
        }
    }
}

var result: [Int] = Array(repeating: 0, count: 2)

func Solution(y: Int, x: Int, N: Int) {
    let color = papers[y][x]
    
    for i in y..<y + N{
        for j in x..<x + N {
            if color != papers[i][j]{
                var M = N / 2
                Solution(y: y, x: x, N: M)
                Solution(y: y, x: x + M, N: M)
                Solution(y: y + M, x: x, N: M)
                Solution(y: y + M, x: x + M, N: M)
                return
            }
        }
    }
    if color == 0{
        result[0] += 1
    } else {
        result[1] += 1
    }
}

Solution(y: 0, x: 0, N: inputCase)
print(result[0])
print(result[1])