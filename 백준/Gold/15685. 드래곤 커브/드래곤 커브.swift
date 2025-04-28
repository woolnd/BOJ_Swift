//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0")!

var curve: [(Int, Int, Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    let x = Int(input[0])!
    let y = Int(input[1])!
    let d = Int(input[2])!
    let g = Int(input[3])!
    curve.append((x, y, d, g))
}

let dx = [1, 0, -1, 0] // 0: →, 1: ↑, 2: ←, 3: ↓
let dy = [0, -1, 0, 1]

var grid = Array(repeating: Array(repeating: false, count: 101), count: 101)

for (startX, startY, d, g) in curve {
    var directions = [d]
    
    // 세대별 방향 생성
    for _ in 0..<g {
        let reversed = directions.reversed()
        for dir in reversed {
            directions.append((dir + 1) % 4)
        }
    }
    
    var x = startX
    var y = startY
    grid[y][x] = true // 시작점 체크
    
    for dir in directions {
        x += dx[dir]
        y += dy[dir]
        
        if x >= 0 && x <= 100 && y >= 0 && y <= 100 {
            grid[y][x] = true
        }
    }
}

// 1×1 정사각형 세기
var answer = 0

for y in 0..<100 {
    for x in 0..<100 {
        if grid[y][x] && grid[y][x+1] && grid[y+1][x] && grid[y+1][x+1] {
            answer += 1
        }
    }
}

print(answer)