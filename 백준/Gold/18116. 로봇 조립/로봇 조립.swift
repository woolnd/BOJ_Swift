//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct DSU {
    private var parent: [Int]
    private var size: [Int]
    
    init(_ n: Int) {
        self.parent = Array(0...n)
        self.size = Array(repeating: 1, count: n + 1)
    }
    
    mutating func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    mutating func union(_ a: Int, _ b: Int) {
        var ra = find(a)
        var rb = find(b)
        
        if ra == rb { return }
        
        if size[ra] < size[rb] { swap(&ra, &rb) }
        parent[rb] = ra
        size[ra] += size[rb]
        
        return
    }
    
    mutating func componentSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}

let MAX = 1_000_000
var dsu = DSU(MAX)

let N = Int(readLine()!)!


for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    
    let command = String(input[0])
    
    if command == "I" {
        let a = Int(input[1])!, b = Int(input[2])!
        dsu.union(a, b)
    } else if command == "Q" {
        let c = Int(input[1])!
        print(dsu.componentSize(c))
    }
}