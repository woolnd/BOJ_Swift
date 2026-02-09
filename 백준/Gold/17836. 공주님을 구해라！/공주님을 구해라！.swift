//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1], T = input[2]

var castle = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    castle[i] = input
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var queue: [(Int, Int, Int)] = []
queue.append((0, 0, 0))

let INF = Int.max

var dist = Array(
    repeating: Array(
        repeating: Array(
            repeating: INF,
            count: 2),
        count: M),
    count: N)

dist[0][0][0] = 0
var idx = 0

while idx < queue.count {
    let (y, x, g) = queue[idx]
    idx += 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        var ng = g
        
        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        if castle[ny][nx] == 1 && g == 0 { continue }
        if castle[ny][nx] == 2 { ng = 1 }
        
        let nd = dist[y][x][g] + 1
        if nd < dist[ny][nx][ng] {
            dist[ny][nx][ng] = nd
            queue.append((ny, nx, ng))
        }
    }
}

let answer = min(dist[N-1][M-1][0], dist[N-1][M-1][1])
if answer <= T { print(answer) }
else { print("Fail") }