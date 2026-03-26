//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1], K = input[2]

var map = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.map { Int($0.asciiValue! - 48) }
    map.append(row)
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: K + 1), count: M), count: N)
var queue: [(Int, Int, Int, Int)] = [(0, 0, 0, 1)]
visited[0][0][0] = true
var idx = 0

while idx < queue.count {
    let (y, x, cnt, dist) = queue[idx]
    idx += 1
    
    if y == N - 1 && x == M - 1 {
        print(dist)
        exit(0)
    }
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        
        if map[ny][nx] == 0 && !visited[ny][nx][cnt] {
            visited[ny][nx][cnt] = true
            queue.append((ny, nx, cnt, dist + 1))
        }
        
        else if map[ny][nx] == 1 && cnt < K && !visited[ny][nx][cnt + 1] {
            visited[ny][nx][cnt + 1] = true
            queue.append((ny, nx, cnt + 1, dist + 1))
        }
    }
}

print(-1)
