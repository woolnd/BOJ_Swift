//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
let N = input[0]
let M = input[1]

var minPack = Int.max
var minSingle = Int.max

for _ in 0..<M {
    let inputInfo = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    let six = inputInfo[0]
    let each = inputInfo[1]
    
    minPack = min(minPack, six)
    minSingle = min(minSingle, each)
}

if minPack > 6 * minSingle {
    print(minSingle * N)
} else {
    let p = N / 6
    let r = N % 6
    
    let a = (p * minPack) + (r * minSingle)
    let b = (p + 1) * minPack
    let c = N * minSingle
    
    let result = min(a, b, c)
    
    print(result)
}