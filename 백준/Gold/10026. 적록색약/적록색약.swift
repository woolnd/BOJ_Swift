//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "") ?? 0

var boards: [[String]] = Array(repeating: [], count: N)

for y in 0..<N {
    let inputCol = Array(readLine()!.map{ String($0) })
    
    boards[y] = inputCol
}

var rgBoards = boards

for y in 0..<N{
    for x in 0..<N{
        if rgBoards[y][x] == "G"{
            rgBoards[y][x] = "R"
        }
    }
}

var visited_normal: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
var visited_rg = visited_normal

func BFS(_ y: Int, _ x: Int, _ color: String, _ board: inout [[String]], _ visited: inout [[Bool]]) {
    var queue: [(Int, Int)] = [(y, x)]
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    while queue.count != 0 {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= N || visited[ny][nx] || board[ny][nx] != color {
                continue
            }
            
            visited[ny][nx] = true
            queue.append((ny, nx))
        }
    }
}

var count_normal = 0
var count_rg = 0

for y in 0..<N{
    for x in 0..<N{
        if !visited_normal[y][x]{
            BFS(y, x, boards[y][x], &boards, &visited_normal)
            count_normal += 1
        }
        if !visited_rg[y][x]{
            BFS(y, x, rgBoards[y][x], &rgBoards, &visited_rg)
            count_rg += 1
        }
    }
}

print("\(count_normal) \(count_rg)")