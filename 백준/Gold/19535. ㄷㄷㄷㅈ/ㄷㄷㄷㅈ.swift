//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var adj = Array(repeating: [Int](), count: N + 1)
var edges: [(Int, Int)] = []

for _ in 0..<N-1{
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    
    adj[a].append(b)
    adj[b].append(a)
    edges.append((a, b))
    
}

func calculateGD(_ N: Int, _ adj: [[Int]], _ edges: [(Int, Int)]) -> (Int64, Int64) {
    
    var G: Int64 = 0
    var D: Int64 = 0
    
    for i in 1...N {
        let degree = Int64(adj[i].count)
        
        if degree >= 3 {
            G += degree * (degree - 1) * (degree - 2) / 6
        }
    }
    
    for (u, v) in edges {
        let degU = Int64(adj[u].count)
        let degV = Int64(adj[v].count)
        
        D += (degU - 1) * (degV - 1)
    }
    
    return (G, D)
}


let (G, D) = calculateGD(N, adj, edges)

if D > 3 * G {
    print("D")
} else if D < 3 * G {
    print("G")
} else if D == 3 * G {
    print("DUDUDUNGA")
}
