//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")

let R = Int(input[0])!
let C = Int(input[1])!
let Q = Int(input[2])!

var A = Array(repeating: Array(repeating: 0, count: C + 1), count: R + 1)

for i in 1...R {
    let inputCol = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    
    for j in 1...C {
        A[i][j] = inputCol[j - 1]
    }
}

var prefixSum = Array(repeating: Array(repeating: 0, count: C + 1), count: R + 1)

for i in 1...R {
    for j in 1...C {
        prefixSum[i][j] = A[i][j] + prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1]
    }
}

for _ in 0..<Q {
    let inputPosition = readLine()!.split(separator: " ")
    let x1 = Int(inputPosition[0])!
    let y1 = Int(inputPosition[1])!
    let x2 = Int(inputPosition[2])!
    let y2 = Int(inputPosition[3])!

    let result = prefixSum[x2][y2] - prefixSum[x1 - 1][y2] - prefixSum[x2][y1 - 1] + prefixSum[x1 - 1][y1 - 1]
    let index = (x2 - x1 + 1) * (y2 - y1 + 1)
    print(result / index)
}