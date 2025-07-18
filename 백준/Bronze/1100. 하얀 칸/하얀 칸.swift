//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var isWhite: Bool = true
var list: [[String]] = Array(repeating: Array(repeating: "", count: 8), count: 8)
var count = 0

for i in 0..<8 {
    let input = Array(readLine()!.map{ String($0) })
    
    list[i] = input
}

for i in 0..<8 {
    for j in 0..<8 {
        if list[i][j] == "F" && isWhite {
            count += 1
        }
        
        isWhite.toggle()
    }
    isWhite.toggle()
}

print(count)