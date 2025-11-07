//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!
var list: [Int] = Array(repeating: 0, count: 101)

list[0] = 0
list[1] = 1
list[2] = 1

for i in 3..<101 {
    list[i] = list[i - 2] + list[i - 3]
}

for _ in 0..<T {
    let N = Int(readLine()!)!
    
    print(list[N])
}