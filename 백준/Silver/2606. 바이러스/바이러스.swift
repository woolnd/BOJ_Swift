//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let computerCount = Int(readLine() ?? "0") ?? 0
let connectionCount = Int(readLine() ?? "0") ?? 0
 
var graph: [[Int]] = Array(repeating: [], count: computerCount + 1)
var visited_DFS: [Bool] = Array(repeating: false, count: computerCount + 1)
var count = 0

for i in 0..<connectionCount {
    if let inputEdge = readLine()?.split(separator: " "), inputEdge.count == 2{
        let edge = inputEdge.compactMap{ Int($0) }
        
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
}

func DFS(V: Int) {
    visited_DFS[V] = true
    count += 1
    
    for i in graph[V].sorted(){
        if !visited_DFS[i] {
            DFS(V: i)
        }
    }
}

DFS(V: 1)
print(count - 1)