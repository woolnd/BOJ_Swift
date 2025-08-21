//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var N = Int(readLine()!)!

var list: [(Int, Int)] = []

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

for i in 0..<N {
    list.append((input[i], i))
}

list.sort { a, b in
    if a.0 == b.0 {
        return a.1 < b.1
    } else {
        return a.0 < b.0
    }
}

var p = Array(repeating: 0, count: N)

for (rank, pair) in list.enumerated() {
    p[pair.1] = rank
}

print(p.map{ String($0) }.joined(separator: " "))