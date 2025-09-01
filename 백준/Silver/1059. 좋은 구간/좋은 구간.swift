//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var L: Int = Int(readLine()!)!
var S: [Int] = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var N: Int = Int(readLine()!)!

var A: Int = 0
var B: Int = 1000

if S.contains(N) {
    print(0)
    exit(0)
}

for index in S {
    if index < N {
        A = max(A, index)
    } else {
        B = min(B, index)
    }
}

let result = (N - A) * (B - N) - 1

if result >= 0 {
    print(result)
} else {
    print(0)
}
