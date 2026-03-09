//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1]

var boards = Array(repeating: [Character](), count: N)

for i in 0..<N {
    let input = Array(readLine()!)
    
    boards[i] = input
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var red: (y: Int, x: Int) = (0, 0)
var blue: (y: Int, x: Int) = (0, 0)


for i in 0..<N {
    for j in 0..<M {
        if String(boards[i][j]) == "R" {
            red = (i, j)
        }
        
        if String(boards[i][j]) == "B" {
            blue = (i, j)
        }
    }
}


func BFS(red: (y: Int, x: Int), blue: (y: Int, x: Int)) -> Int {
    var visited = Array(repeating:
                            Array(repeating:
                                    Array(repeating:
                                            Array(repeating: -1, count: M), count: N), count: M), count: N)
    
    var queue: [(ry: Int, rx: Int, by: Int, bx: Int, count: Int)] = []
    queue.append((red.y, red.x, blue.y, blue.x, 0))
    
    var idx = 0
    
    while idx < queue.count {
        let (ry, rx, by, bx, cnt) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            var nry = ry, nrx = rx
            var nby = by, nbx = bx
            
            var rDist = 0
            var bDist = 0
            
            // 빨간 구슬 굴리기
            while boards[nry + dy[i]][nrx + dx[i]] != "#" && boards[nry][nrx] != "O" {
                nry += dy[i]
                nrx += dx[i]
                rDist += 1
            }
            
            // 파란 구슬 굴리기
            while boards[nby + dy[i]][nbx + dx[i]] != "#" && boards[nby][nbx] != "O" {
                nby += dy[i]
                nbx += dx[i]
                bDist += 1
            }
            
            if boards[nby][nbx] == "O" { continue }
            if boards[nry][nrx] == "O" { return cnt + 1 }
            if nry == nby && nrx == nbx {
                if rDist > bDist {
                    nry -= dy[i]
                    nrx -= dx[i]
                } else {
                    nby -= dy[i]
                    nbx -= dx[i]
                }
            }
            
            if visited[nry][nrx][nby][nbx] == -1 {
                visited[nry][nrx][nby][nbx] = cnt + 1
                queue.append((nry, nrx, nby, nbx, cnt + 1))
            }
        }
    }
    
    return -1
}

let result = BFS(red: red, blue: blue)
print(result)