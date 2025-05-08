//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let K = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

var levels = Array(repeating: [Int](), count: K)

func buildLevels(_ nodes: [Int], _ depth: Int) {
    if nodes.isEmpty { return }

    let mid = nodes.count / 2
    levels[depth].append(nodes[mid])
    
    buildLevels(Array(nodes[..<mid]), depth + 1)
    buildLevels(Array(nodes[(mid+1)...]), depth + 1)
}

buildLevels(input, 0)

for level in levels {
    print(level.map { String($0) }.joined(separator: " "))
}