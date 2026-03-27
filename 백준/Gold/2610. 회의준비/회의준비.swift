//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var parent = Array(0...N)

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

var dist = Array(repeating: Array(repeating: 101, count: N + 1), count: N + 1)

for i in 1...N { dist[i][i] = 0 }

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    
    dist[a][b] = 1
    dist[b][a] = 1
    
    union(a, b)
}

for k in 1...N {
    for i in 1...N {
        for j in 1...N {
            dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
        }
    }
}

var representative = [Int]()
let groups = Dictionary(grouping: Array(1...N), by: { find($0) })

for (_, members) in groups {
    var minMaxDist = Int.max
    var leader = 0
    
    for i in members {
        var currentMax = 0
        
        for j in members {
            currentMax = max(currentMax, dist[i][j])
        }
        
        if currentMax < minMaxDist {
            minMaxDist = currentMax
            leader = i
        }
    }
    
    representative.append(leader)
}

representative.sort(by: <)

print(representative.count)

for i in 0..<representative.count {
    print(representative[i])
}