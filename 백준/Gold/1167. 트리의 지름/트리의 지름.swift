//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation


let V = Int(readLine()!)!

var graph: [[Int : Int]] = Array(repeating: [Int : Int](), count: V + 1)

for i in 0..<V {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    var idx = 1
    
    while input[idx] != -1 {
        let to = input[idx]
        let distance = input[idx + 1]
        graph[from][to] = distance
        idx += 2
    }
}


let firstDistance = bfs(1)
let maxFirstDistance = firstDistance.max()!
let farthestNode = firstDistance.firstIndex(of: maxFirstDistance)!

let secondDistance = bfs(farthestNode)
let maxSecondDistance = secondDistance.max()!

print(max(maxFirstDistance, maxSecondDistance))


func bfs(_ start: Int) -> [Int] {
    var visited: [Bool] = Array(repeating: false, count: V + 1)
    var distance: [Int] = Array(repeating: 0, count: V + 1)
    var queue = [start]
    visited[0] = true
    visited[start] = true


    while queue.count != 0 {
        let node = queue.removeFirst()
        visited[node] = true
        
        for next in graph[node] {
            if !visited[next.key] {
                distance[next.key] = distance[node] + next.value
                queue.append(next.key)
            }
        }
    }
    
    return distance
}