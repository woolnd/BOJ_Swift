//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var position: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    let x = Int(input[0])!
    let y = Int(input[1])!
    
    position.append((x, y))
}

var len = 0
var start = position[0].0
var end = position[0].1


for i in 1..<position.count {
    let (s, e) = position[i]
    
    if s <= end {
        end = max(end, e)
    } else {
        len += end - start
        
        end = e
        start = s
    }
}

len += end - start
print(len)