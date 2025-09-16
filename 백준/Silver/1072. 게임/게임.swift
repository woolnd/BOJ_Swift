//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var X = input[0]
var Y = input[1]
let Z0 = (Y * 100) / X
var count = 0

if Z0 >= 99{
    print(-1)
    exit(0)
}

var low = 1
var high = 1_000_000_000
var answer: Int64 = -1

while low <= high {
    let mid = (low + high) / 2
    
    let Z = (((Y + mid) * 100) / (X + mid))
    
    if Z > Int64(Z0) {
        answer = Int64(mid)
        high = mid - 1
    } else {
        low = mid + 1
    }
}

print(answer)