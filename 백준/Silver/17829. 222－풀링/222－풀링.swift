//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0") ?? 0

var matrix: [[Int]] = Array(repeating: [], count: N)

for i in 0..<N{
    if let input = readLine()?.split(separator: " "), input.count == N{
        let inputMatrix = input.compactMap{ Int($0) }
        matrix[i] = inputMatrix
    }
}


func NewPolling(N: Int) {
    if N == 1 {
        print(matrix[0][0])
        return
    }
    
    var newMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: N / 2), count: N / 2)
    
    for i in stride(from: 0, to: N, by: 2){
        for j in stride(from: 0, to: N, by: 2){
            let value = [matrix[i][j], matrix[i + 1][j], matrix[i][j + 1], matrix[i + 1][j + 1]]
            newMatrix[i/2][j/2] = value.sorted()[2]
        }
    }
    
    matrix = newMatrix
    NewPolling(N: N / 2)
}

NewPolling(N: N)