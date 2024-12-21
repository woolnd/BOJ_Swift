//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation


let input = Int(readLine() ?? "0") ?? 0
var cards = [Int](repeating: 0, count: 10001)

for _ in 0..<input {
    cards[Int(readLine() ?? "0") ?? 0] += 1
}

var result = ""

for i in 0..<10001{
    result += String(repeating: "\(i)\n", count: cards[i])
}

print(result)