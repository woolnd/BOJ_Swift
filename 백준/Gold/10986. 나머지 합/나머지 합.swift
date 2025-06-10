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

let inputList = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var prefixSum = Array(repeating: 0, count: N)

prefixSum[0] = inputList[0]

for i in 1..<N {
    prefixSum[i] = inputList[i] + prefixSum[i - 1]
}

var modCount = Array(repeating: 0, count: M)

var count = 0

for i in 0..<N {
    let modValue = prefixSum[i] % M
    let positiveMod = (modValue + M) % M

    if positiveMod == 0 {
        count += 1
    }

    count += modCount[positiveMod]

    modCount[positiveMod] += 1
}

print(count)