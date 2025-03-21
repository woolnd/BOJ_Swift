//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "") ?? 0

var times: [(Int, Int)] = []

for _ in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == 2{
        times.append((Int(input[0]) ?? 0 , Int(input[1]) ?? 0))
    }
}


times.sort { a, b in
    if a.1 == b.1 {
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}

var lastTime = 0
var count = 0

for (start, last) in times {
    if start >= lastTime{
        count += 1
        lastTime = last
    }
}

print(count)