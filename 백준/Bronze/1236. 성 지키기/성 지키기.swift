//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0)) })

let N = input[0]!
let M = input[1]!

var position = Array(repeating: Array(repeating: " ", count: M), count: N)
var rowSecurity = Array(repeating: false, count: N)
var colSecurity = Array(repeating: false, count: M)

for i in 0..<N {
    let input = Array(readLine()!.map{ String($0) })
    position[i] = input
}

for i in 0..<N {
    for j in 0..<M {
        if position[i][j] == "X" {
            rowSecurity[i] = true
            colSecurity[j] = true
        }
    }
}

var rowCount = 0
var colCount = 0

for i in 0..<N {
    if !rowSecurity[i] {
        rowCount += 1
    }
}

for i in 0..<M {
    if !colSecurity[i] {
        colCount += 1
    }
}

print(max(rowCount, colCount))