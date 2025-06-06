//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let K = Int(input[1])!

let list = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var prefixSum: [Int] = Array(repeating: 0, count: N)
prefixSum[0] = list[0]

for i in 1..<N {
    prefixSum[i] = list[i] + prefixSum[i - 1]
}

var sum = Int.min
var start = 0
var end = 0

while end < N {
    if end - start == K - 1{
        if start > 0 {
            let temp = prefixSum[end] - prefixSum[start - 1]
            sum = max(temp, sum)
        } else {
            let temp = prefixSum[end]
            sum = max(temp, sum)
        }
        
        start += 1
    } else {
        end += 1
    }
}

print(sum)