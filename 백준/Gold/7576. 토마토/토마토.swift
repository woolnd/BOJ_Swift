//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let M = Int(input[0]) ?? 0
    let N = Int(input[1]) ?? 0
    
    var tomatoBox: [[Int]] = Array(repeating: [], count: N)
    
    for i in 0..<N {
        if let inputTomato = readLine()?.split(separator: " "), inputTomato.count == M {
            let intTomato = inputTomato.compactMap{ Int($0) }
            
            tomatoBox[i] = intTomato
        }
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var check: Bool = true
    for i in 0..<N {
        for j in 0..<M {
            if tomatoBox[i][j] == 0{
                check = false
                break
            }
        }
        
        if !check { break }
    }
    
    if check {
        print(0)
    } else {
        print(BFS())
    }
    
    func BFS() -> Int {
        var queue: [(Int, Int)] = []
        
        for i in 0..<N {
            for j in 0..<M{
                if tomatoBox[i][j] == 1{
                    queue.append((i, j))
                }
            }
        }
        
        var index = 0
        
        while index < queue.count{
            var (x, y) = queue[index]
            
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= M {
                    continue
                }
                if tomatoBox[nx][ny] == 0{
                    tomatoBox[nx][ny] = tomatoBox[x][y] + 1
                    queue.append((nx, ny)) /// 새로운  익은 토마토 추가
                }
            }
            
            index += 1
        }
        
        var maxDay = 0
        
        for i in 0..<N {
            for j in 0..<M{
                if tomatoBox[i][j] == 0{
                    return -1
                }
                maxDay = max(maxDay, tomatoBox[i][j])
            }
        }
    
        return maxDay - 1
    }  
}