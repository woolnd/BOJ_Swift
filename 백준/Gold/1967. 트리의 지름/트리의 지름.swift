//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine()!)!
var graph = Array(repeating: [(Int, Int)](), count: n + 1)

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    graph[a].append((b, c))
    graph[b].append((a, c))
}

func bfs(start: Int) -> (Int, Int) {
    var dist = Array(repeating: -1, count: n + 1)
    var queue = [start]
    dist[start] = 0
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        index += 1
        
        for (next, cost) in graph[now] {
            if dist[next] == -1 {
                dist[next] = dist[now] + cost
                queue.append(next)
            }
        }
    }
    
    var bestNode = start
    var bestDist = 0
    
    for i in 1...n {
        if dist[i] > bestDist {
            bestDist = dist[i]
            bestNode = i
        }
    }
    
    return (bestNode, bestDist)
}

if n == 1{
    print(0)
} else {
    let x = bfs(start: 1).0
    let result = bfs(start: x).1
    print(result)
}
