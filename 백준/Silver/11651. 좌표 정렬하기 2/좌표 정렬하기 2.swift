//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var list: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    list.append((input[0], input[1]))
}

list.sort { a, b in
    if a.1 == b.1 {
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}

for position in list {
    print("\(position.0) \(position.1)")
}