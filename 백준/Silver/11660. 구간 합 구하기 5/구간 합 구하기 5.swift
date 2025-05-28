//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!

var A = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
var S = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)


for i in 1...N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 1...N {
        A[i][j] = row[j - 1]
    }
}

for i in 1...N {
    for j in 1...N {
        S[i][j] = A[i][j] + S[i - 1][j] + S[i][j - 1] - S[i - 1][j - 1]
    }
}


for _ in 0..<M {
    let inputPosition = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    
    let x1 = inputPosition[0]
    let y1 = inputPosition[1]
    let x2 = inputPosition[2]
    let y2 = inputPosition[3]
    
    let result = S[x2][y2] - S[x1 - 1][y2] - S[x2][y1 - 1] + S[x1 - 1][y1 - 1]
    print(result)
}