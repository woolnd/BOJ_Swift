//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

final class FileIO {
    private var buffer = [UInt8]()
    private var index = 0
    
    init() {
        buffer = Array(try! FileHandle.standardInput.readToEnd()!) + [UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        while now <= 32 { now = read() }
        let negative = now == 45
        if negative { now = read() }
        while now >= 48 && now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        return negative ? -sum : sum
    }
}

let file = FileIO()

struct Edge {
    let u: Int
    let v: Int
    let weight: Int
}

while true {
    let m = file.readInt()
    let n = file.readInt()
    
    if m == 0 && n == 0 { break }
    
    var edges = [Edge]()
    var totalWeight = 0
    
    for _ in 0..<n {
        let u = file.readInt()
        let v = file.readInt()
        let w = file.readInt()
        
        edges.append(Edge(u: u, v: v, weight: w))
        totalWeight += w
    }
    
    var parent = Array(0...m)
    
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    func union(_ a: Int, _ b: Int) {
        let parentA = find(a)
        let parentB = find(b)
        
        if parentA != parentB {
            parent[parentA] = parentB
        }
    }
    
    edges.sort { $0.weight < $1.weight }
    var mstWeight = 0
    var edgeCount = 0
    
    for edge in edges {
        if find(edge.u) != find(edge.v) {
            union(edge.u, edge.v)
            mstWeight += edge.weight
            
            edgeCount += 1
            
            if edgeCount == m - 1 { break }
        }
    }
    
    print(totalWeight - mstWeight)
}