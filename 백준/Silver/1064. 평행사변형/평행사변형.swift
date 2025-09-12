//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

var A: (Int, Int) = (input[0], input[1])
var B: (Int, Int) = (input[2], input[3])
var C: (Int, Int) = (input[4], input[5])

let check = ((B.0 - A.0) * (C.1 - A.1)) - ((B.1 - A.1) * (C.0 - A.0))

if check == 0{
    print(-1.0)
    exit(0)
}

var result: [Double] = []

func dist(_ p1: (Int, Int), _ p2: (Int, Int)) -> Double {
    let dx = Double(p1.0 - p2.0)
    let dy = Double(p1.1 - p2.1)
    
    return sqrt(dx*dx + dy*dy)
}

result.append((dist(A, B) + dist(A, C)) * 2)
result.append((dist(A, C) + dist(B, C)) * 2)
result.append((dist(A, B) + dist(B, C)) * 2)

print(result.max()! - result.min()!)
