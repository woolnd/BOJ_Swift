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

var A = Array(repeating: 0, count: N)

for i in 0..<N {
    let inputA = Int(readLine()!)!
    
    A[i] = inputA
}

A.sort()


var minResult = Int.max
var start = 0
var end = 0

while end < N {
    let temp = A[end] - A[start]
    
    if temp >= M {
        minResult = min(minResult, temp)
        start += 1
    } else {
        end += 1
    }
    
    if start > end {
        end = start
    }
}

print(minResult)