//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = readLine()!.split(separator: " ")
let N = Int(inputCase[0]) ?? 0
let M = Int(inputCase[1]) ?? 0

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let IntCol = Array(inputCol.map{ Int(String($0))!} )
    
    board[i] = IntCol
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var cctvList: [(Int, Int, Int)] = []

for i in 0..<N {
    for j in 0..<M {
        if board[i][j] != 0 && board[i][j] != 6 {
            cctvList.append((i, j, board[i][j]))
        }
    }
}

let cctvDirections = [
    [],
    [[0], [1], [2], [3]],
    [[0, 2], [1, 3]],
    [[0, 1], [1, 2], [2, 3], [3, 0]],
    [[0, 1, 3], [0, 1, 2], [1, 2, 3], [2, 3, 0]],
    [[0, 1, 2, 3]]
]

var minValue = Int.max

func DFS(_ depth: Int, _ board: inout [[Int]]) {
    if depth == cctvList.count {
        var chk = 0
        for i in 0..<N {
            for j in 0..<M {
                if board[i][j] == 0{
                    chk += 1
                }
            }
        }
        minValue = min(minValue, chk)
        
        return
    }
    
    let (y, x, type) = cctvList[depth]
    
    for dirSet in cctvDirections[type] {
        var newBoard = board
        
        for dir in dirSet {
            var ny = y
            var nx = x
            
            while true {
                ny += dy[dir]
                nx += dx[dir]
                
                if ny < 0 || ny >= N || nx < 0 || nx >= M { break }
                if newBoard[ny][nx] == 6 { break }
                
                if newBoard[ny][nx] == 0 { newBoard[ny][nx] = -1 }
            }
        }
        
        DFS(depth + 1, &newBoard)
    }
}

DFS(0, &board)
print(minValue)