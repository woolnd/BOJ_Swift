//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine() ?? "0") ?? 0
var visited_DFS: [Bool] = Array(repeating: false, count: n + 1)
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var found = false
var result = -1

if let inputRelatives = readLine()?.split(separator: " "), inputRelatives.count == 2{
    let relatives = inputRelatives.compactMap{ Int($0) }
    let start = relatives[0]
    let target = relatives[1]
    
    let inputCase = Int(readLine() ?? "0") ?? 0
    
    for i in 0..<inputCase {
        if let inputNodes = readLine()?.split(separator: " "), inputNodes.count == 2{
            let nodes = inputNodes.compactMap{ Int($0) }
            
            graph[nodes[0]].append(nodes[1])
            graph[nodes[1]].append(nodes[0])
        }
    }
    
    
    func DFS(V: Int, depth: Int) {
        if V == target {
            found = true
            result = depth
            return
        }
        
        visited_DFS[V] = true
        
        for i in graph[V] {
            if !visited_DFS[i] {
                DFS(V: i, depth: depth + 1)
                if found { return }
            }
        }
    }
    
    DFS(V: start, depth: 0)
    print(result)
}