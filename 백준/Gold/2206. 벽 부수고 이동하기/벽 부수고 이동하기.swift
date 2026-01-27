//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]

var grid = Array(repeating: Array(repeating: UInt8(0), count: M), count: N)

for i in 0..<N {
    let line = Array(readLine()!.utf8)
    
    for j in 0..<M {
        grid[i][j] = line[j]
    }
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var visited = Array(
    repeating: Array(
        repeating: Array(
            repeating: false,
            count: M),
        count: N),
    count: 2)
visited[0][0][0] = true

var queue: [(Int, Int, Int, Int)] = []
queue.append((0, 0, 0, 1))

var idx = 0

while idx < queue.count {
    let (y, x, broken, d) = queue[idx]
    idx += 1
    
    if y == N - 1 && x == M - 1 {
        print(d)
        exit(0)
    }
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        
        if grid[ny][nx] == 48 {
            if !visited[broken][ny][nx] {
                visited[broken][ny][nx] = true
                queue.append((ny, nx, broken, d + 1))
            }
        } else {
            if broken == 0 && !visited[1][ny][nx] {
                visited[1][ny][nx] = true
                queue.append((ny, nx, 1, d + 1))
            }
        }
    }
}

print(-1)