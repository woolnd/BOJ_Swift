//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

let total = input.reduce(0, +)
var frequency = Array(repeating: 0, count: total + 1)

for i in 1...input[0] {
    for j in 1...input[1] {
        for k in 1...input[2] {
            let temp = i + j + k
            
            frequency[temp] += 1
        }
    }
}

let maxValue = frequency.max()!
let result = frequency.firstIndex(of: maxValue)!
print(result)