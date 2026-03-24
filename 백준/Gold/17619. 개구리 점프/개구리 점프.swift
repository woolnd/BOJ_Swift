//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let N = input[0], Q = input[1]

struct Log {
    let x1: Int
    let x2: Int
    let id: Int
}

var logs = [Log]()

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    logs.append(Log(x1: input[0], x2: input[1], id: i))
}

logs.sort { $0.x1 < $1.x1 }

var parent = Array(0...N)

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    if rootA != rootB {
        parent[rootA] = rootB
    }
}

var currentMaxX2 = logs[0].x2
var lastId = logs[0].id

for i in 1..<N {
    if logs[i].x1 <= currentMaxX2 {
        union(lastId, logs[i].id)
        
        currentMaxX2 = max(currentMaxX2, logs[i].x2)
    } else {
        currentMaxX2 = logs[i].x2
    }
    lastId = logs[i].id
}

for _ in 0..<Q {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    let u = query[0], v = query[1]
    if find(u) == find(v) {
        print(1)
    } else {
        print(0)
    }
}