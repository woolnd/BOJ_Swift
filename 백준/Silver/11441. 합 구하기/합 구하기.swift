//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var A = Array(repeating: 0, count: N)

let inputA = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

for i in 0..<N {
    if i != 0 {
        A[i] = inputA[i] + A[i - 1]
    } else {
        A[i] = inputA[i]
    }
}

let M = Int(readLine()!)!

for _ in 0..<M {
    let inputIJ = readLine()!.split(separator: " ")
    let i = Int(inputIJ[0])! - 1
    let j = Int(inputIJ[1])! - 1
    
    if i > 0 {
        print(A[j] - A[i-1])
    }
    else {
        print(A[j])
    }
}
