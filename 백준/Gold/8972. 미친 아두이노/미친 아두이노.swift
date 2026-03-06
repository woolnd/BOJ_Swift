//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let R = input[0], C = input[1]

var boards = Array(repeating: [String](), count: R)

for i in 0..<R {
    let input = readLine()!.map{ String($0) }
    boards[i] = input
}

let dir = Array(readLine()!)

var idx = 0


let dy = [1, 1, 1, 0, 0, 0, -1, -1, -1]
let dx = [-1, 0, 1, -1, 0, 1, -1, 0, 1]

var jy = 0, jx = 0
var crazyArduinos = [(Int, Int)]()

for y in 0..<R {
    for x in 0..<C {
        if boards[y][x] == "I" {
            jy = y
            jx = x
        } else if boards[y][x] == "R" {
            crazyArduinos.append((y, x))
        }
    }
}

while idx < dir.count {
    let currentDir = dir[idx]
    idx += 1
    let moveIdx = Int(String(currentDir))! - 1
    boards[jy][jx] = "."
    
    jy += dy[moveIdx]
    jx += dx[moveIdx]
    
    if boards[jy][jx] == "R" {
        print("kraj \(idx)")
        exit(0)
    }
    
    boards[jy][jx] = "I"
    
    var tempBoard = Array(repeating: Array(repeating: 0, count: C), count: R)
    
    for r in crazyArduinos {
        var minDist = Int.max
        var nextRY = r.0
        var nextRX = r.1
        
        for i in 0..<9 {
            if i == 4 { continue }
            
            let ny = r.0 + dy[i]
            let nx = r.1 + dx[i]
            
            if ny < 0 || ny >= R || nx < 0 || nx >= C { continue }
            let dist = abs(jy - ny) + abs(jx - nx)
            
            if dist < minDist {
                minDist = dist
                nextRY = ny
                nextRX = nx
            }
            
        }
        
        if nextRY == jy && nextRX == jx {
            print("kraj \(idx)")
            exit(0)
        }
        
        tempBoard[nextRY][nextRX] += 1
    }
    
    for r in crazyArduinos {
        boards[r.0][r.1] = "."
    }
    
    var nextCrazyArduinos = [(Int, Int)]()
    
    for y in 0..<R {
        for x in 0..<C {
            if tempBoard[y][x] == 1 {
                boards[y][x] = "R"
                nextCrazyArduinos.append((y, x))
            } else if tempBoard[y][x] > 1 {
                boards[y][x] = "."
            }
        }
    }
    
    crazyArduinos = nextCrazyArduinos
    boards[jy][jx] = "I"
}

for y in 0..<R {
    let result = boards[y].map{ String($0) }.joined(separator: "")
    print(result)
}