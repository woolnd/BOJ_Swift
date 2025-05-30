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

var A = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
var prefixSum = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

for i in 1...N {
    let inputArray = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    
    for j in 1...M {
        A[i][j] = inputArray[j - 1]
    }
}

for i in 1...N {
    for j in 1...M {
        prefixSum[i][j] = A[i][j] + prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1]
    }
}

let K = Int(readLine()!)!

for _ in 0..<K {
    let inputPosition = readLine()!.split(separator: " ")
    let x1 = Int(inputPosition[0])!
    let y1 = Int(inputPosition[1])!
    let x2 = Int(inputPosition[2])!
    let y2 = Int(inputPosition[3])!
    
    let result = prefixSum[x2][y2] - prefixSum[x1 - 1][y2] - prefixSum[x2][y1 - 1] + prefixSum[x1 - 1][y1 - 1]
    print(result)
}