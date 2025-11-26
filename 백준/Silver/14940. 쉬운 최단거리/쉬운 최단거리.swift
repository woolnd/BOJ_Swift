//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let n = inputNM[0], m = inputNM[1]
var graph = Array(repeating: [Int](), count: n)

for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var dist = Array(repeating: Array(repeating: 0, count: m), count: n)

let dy = [1, -1, 0, 0]
let dx = [0, 0, -1, 1]

func bfs(_ y: Int, _ x: Int) {
    var queue: [(Int, Int)] = [(y, x)]
    visited[y][x] = true
    dist[y][x] = 0
    
    var idx = 0
    
    while idx < queue.count {
        let (sy, sx) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let ny = sy + dy[i]
            let nx = sx + dx[i]
            
            if ny < 0 || ny >= n || nx < 0 || nx >= m { continue }
            if graph[ny][nx] == 0 { continue }
            if visited[ny][nx] { continue }
            
            visited[ny][nx] = true
            dist[ny][nx] = dist[sy][sx] + 1
            
            queue.append((ny, nx))
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 2 {
            bfs(i, j)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 1 && visited[i][j] == false {
            dist[i][j] = -1 
        }
    }
}

for i in 0..<n {
    print(dist[i].map{ String($0) }.joined(separator: " "))
}