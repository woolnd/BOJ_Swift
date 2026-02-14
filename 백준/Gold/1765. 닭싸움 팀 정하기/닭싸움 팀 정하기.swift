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

    mutating func union(_ a: Int, _ b: Int) -> Bool {
        var ra = find(a)
        var rb = find(b)
        if ra == rb { return false }
        if size[ra] < size[rb] { swap(&ra, &rb) }
        parent[rb] = ra
        size[ra] += size[rb]
        return true
    }
}

// 입력
let n = Int(readLine()!)!
let m = Int(readLine()!)!

var dsu = DSU(n)
var enemy = Array(repeating: [Int](), count: n + 1)
var ans = n

for _ in 0..<m {
    let parts = readLine()!.split(separator: " ")
    let t = parts[0].first!
    let p = Int(parts[1])!
    let q = Int(parts[2])!

    if t == "F" {
        if dsu.union(p, q) { ans -= 1 }
    } else {
        enemy[p].append(q)
        enemy[q].append(p)
    }
}

// 원수의 원수는 친구
for i in 1...n {
    for e in enemy[i] {
        for f in enemy[e] {
            if dsu.union(i, f) { ans -= 1 }
        }
    }
}

print(ans)
