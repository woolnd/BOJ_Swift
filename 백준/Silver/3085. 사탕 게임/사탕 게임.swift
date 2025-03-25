//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

var board: [[String]] = Array(repeating: [], count: inputCase)

for i in 0..<inputCase {
    let input = Array(readLine()!.map{ String($0) })
    
    board[i] = input
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var result = 0

for i in 0..<inputCase{
    for j in 0..<inputCase{
        for index in 0..<4{
            let nx = i + dx[index]
            let ny = j + dy[index]
            
            if nx < 0 || nx >= inputCase || ny < 0 || ny >= inputCase {
                continue
            }
            
            let temp = board[i][j]
            board[i][j] = board[nx][ny]
            board[nx][ny] = temp
            
            result = max(result, chkMaxCount(board, i, j, nx, ny))
            
            board[nx][ny] = board[i][j]
            board[i][j] = temp
            
        }
    }
}

print(result)

func chkMaxCount(_ board: [[String]], _ x: Int, _ y: Int, _ nx: Int, _ ny: Int) -> Int{
    var maxCount = 1
    let n = board.count
    
    for row in Set([x, nx]){
        var count = 1
        for col in 1..<n {
            if board[row][col] == board[row][col - 1] {
                count += 1
                maxCount = max(maxCount, count)
            } else {
                count = 1
            }
        }
    }
    
    for col in Set([y, ny]){
        var count = 1
        for row in 1..<n {
            if board[row][col] == board[row - 1][col] {
                count += 1
                maxCount = max(maxCount, count)
            } else {
                count = 1
            }
        }
    }
    
    
    return maxCount
}