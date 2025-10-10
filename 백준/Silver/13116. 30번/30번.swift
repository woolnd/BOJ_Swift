//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!

let max = 1023
var tree = Array(repeating: 0, count: max + 1)

for i in 2...max {
    tree[i] = i / 2
}

func check(a: Int, b: Int, tree: [Int]) -> Int {
    var a = a, b = b
    var visited = Set<Int>()
    
    while a > 0 {
        visited.insert(a)
        a = tree[a]
    }
    
    while b > 0 {
        if visited.contains(b) { return b }
        b = tree[b]
    }
    
    return 1
}

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let A = input[0]
    let B = input[1]
    
    let result = check(a: A, b: B, tree: tree)
    print(result * 10)
}