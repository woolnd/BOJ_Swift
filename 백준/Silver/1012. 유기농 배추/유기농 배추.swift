//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    var count = 0
    let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    let M = input[0] // 가로
    let N = input[1] // 세로
    let K = input[2] // 배추 위치 갯수
    
    var section = Array(repeating: Array(repeating: 0, count: M), count: N)
    var list: [(Int, Int)] = []
    
    for _ in 0..<K {
        let inputXY = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
        let X = inputXY[0]
        let Y = inputXY[1]
        
        section[Y][X] = 1
        list.append((Y, X))
    }
    
    let y = [-1, 1, 0, 0]
    let x = [0, 0, 1, -1]
    
    for index in list {
        if section[index.0][index.1] == 0 { continue }
        
        var stack = [index]
        section[index.0][index.1] = 0
        
        while let (cy, cx) = stack.popLast() {
            for i in 0..<4 {
                let dy = cy + y[i]
                let dx = cx + x[i]
                
                if dy < 0 || dy >= N || dx < 0 || dx >= M { continue }
                if section[dy][dx] == 1 {
                    section[dy][dx] = 0
                    stack.append((dy, dx))
                }
            }
        }
        
        count += 1
    }
    
    print(count)
}