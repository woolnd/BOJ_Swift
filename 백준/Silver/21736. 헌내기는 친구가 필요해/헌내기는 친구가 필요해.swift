//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var campus = Array(repeating: [String](), count: N)

let dy = [1, -1, 0, 0]
let dx = [0, 0, -1, 1]

for i in 0..<N {
    let input = readLine()!.map{ String($0) }
    
    campus[i] = input
}

var start = (0, 0)

for i in 0..<N {
    for j in 0..<M {
        if campus[i][j] == "I" {
            start = (i, j)
            break
        }
    }
}

var visited = Array(repeating: Array(repeating: false, count: M), count: N)

visited[start.0][start.1] = true

var queue: [(Int, Int)] = [(start.0, start.1)]
var count = 0

while !queue.isEmpty {
    let (y, x) = queue.removeFirst()
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        if visited[ny][nx] { continue }
        if campus[ny][nx] == "X" { continue }
        
        visited[ny][nx] = true
        
        if campus[ny][nx] == "P" { count += 1 }
        
        queue.append((ny, nx))
    }
}

if count == 0 {
    print("TT")
} else {
    print(count)
}