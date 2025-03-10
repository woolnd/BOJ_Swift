//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let N = Int(input[0]) ?? 0
    let M = Int(input[1]) ?? 0
    
    var maze: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
    var resultCount: [Int] = []
    
    for i in 0..<N {
        if let inputM = readLine() {
            let row = inputM.map { Int(String($0)) ?? 0 } // 문자 하나씩 변환
            if row.count == M { // 입력 개수 확인
                maze[i] = row
            }
        }
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    
    func BFS() -> Int {
        var queue: [(Int, Int, Int)] = [(0, 0, 1)]
        var index = 0
        
        while index < queue.count {
            let (x, y, distance) = queue[index]
            index += 1
            
            if x == N - 1 && y == M - 1{
                return distance
            }
            
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= M || maze[nx][ny] == 0{
                    continue
                }
                
                maze[nx][ny] = 0
                queue.append((nx, ny, distance + 1))
            }
        }
        
        return -1
    }
    
    print(BFS())
}