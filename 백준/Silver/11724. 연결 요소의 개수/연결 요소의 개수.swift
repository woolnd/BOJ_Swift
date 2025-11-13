//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let U = input[0], V = input[1]
    
    graph[U].append(V)
    graph[V].append(U)
}

var visited = Array(repeating: false, count: N + 1)
var result = 0

for i in 1...N {
    if !visited[i] {
        var queue = [i]
        visited[i] = true
        result += 1
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for next in graph[current] {
                
                if !visited[next] {
                    visited[next] = true
                        queue.append(next)
                }
            }
        }
    }
}

print(result)