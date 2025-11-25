//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N)
var result = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[i] = input
}

func bfs( _ start: Int) -> [Bool] {
    var visited = Array(repeating: false, count: N)
    
    var queue = [start]
    
    while !queue.isEmpty {
        let x = queue.removeFirst()
        
        for next in 0..<N {
            if graph[x][next] == 1 && !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
    
    return visited
}

for i in 0..<N {
    let visited = bfs(i)
    for j in 0..<N {
        result[i][j] = visited[j] ? 1 : 0
    }
}

for i in 0..<N {
    print(result[i].map{ String($0) }.joined(separator: " "))
}