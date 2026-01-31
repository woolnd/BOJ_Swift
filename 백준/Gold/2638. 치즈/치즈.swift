//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]
var papers = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    papers[i] = input
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var time = 0

while true {
    var queue: [(Int, Int)] = []
    queue.append((0, 0))
    
    var idx = 0
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    var touch = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    while idx < queue.count {
        let (y, x) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
            if visited[ny][nx] { continue }
            
            if papers[ny][nx] == 0 {
                visited[ny][nx] = true
                queue.append((ny, nx))
            } else {
                touch[ny][nx] += 1
            }
        }
    }
    
    var melted = 0
    for y in 0..<N {
        for x in 0..<M {
            if touch[y][x] >= 2 && papers[y][x] == 1{
                melted += 1
                papers[y][x] = 0
            }
        }
    }
    
    if melted == 0 { break }
    time += 1
}

print(time)