//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let L = Int(input[1])!
let R = Int(input[2])!

var section: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    section[i] = intCol
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var day = 0

while true {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    var moved = false
    
    for r in 0..<N {
        for c in 0..<N {
            if !visited[r][c] {
                let union = BFS(r, c, &visited)
                if union.count > 1{
                    var totalPeople = 0
                    for (y, x) in union {
                        totalPeople += section[y][x]
                    }
                    let average = totalPeople / union.count
                    for (y, x) in union {
                        section[y][x] = average
                    }
                    moved = true
                }
            }
        }
    }
    
    if !moved { break }
    day += 1
}

func BFS(_ y: Int, _ x: Int, _ visited: inout [[Bool]]) -> [(Int, Int)]{
    var union: [(Int, Int)] = [(y, x)]
    visited[y][x] = true
    var queue = [(y, x)]
    
    while queue.count != 0 {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= N || nx < 0 || nx >= N { continue }
            if visited[ny][nx] { continue }
            
            let diff = abs(section[y][x] - section[ny][nx])
            
            if diff >= L && diff <= R {
                visited[ny][nx] = true
                union.append((ny, nx))
                queue.append((ny, nx))
            }
        }
    }
    
    return union
}

print(day)