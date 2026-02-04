//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

func bfs(startY: Int, startX: Int, section: [[Character]]) -> Int {
    let h = section.count
    let w = section[0].count
    
    var fireTime = Array(repeating: Array(repeating: -1, count: w), count: h)
    var dist = Array(repeating: Array(repeating: -1, count: w), count: h)
    
    var fireQueue: [(Int, Int)] = []
    var fHead = 0
    for i in 0..<h {
        for j in 0..<w {
            if section[i][j] == "*"{
                fireQueue.append((i, j))
                fireTime[i][j] = 0
            }
        }
    }
    
    while  fHead < fireQueue.count {
        let (y, x) = fireQueue[fHead]
        fHead += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= h || nx < 0 || nx >= w { continue }
            if section[ny][nx] == "#" { continue }
            if fireTime[ny][nx] != -1 { continue }
            
            fireTime[ny][nx] = fireTime[y][x] + 1
            fireQueue.append((ny, nx))
        }
    }
    
    var mainQueue: [(Int, Int)] = [(startY, startX)]
    var mHead = 0
    dist[startY][startX] = 0
    
    while mHead < mainQueue.count {
        let (y, x) = mainQueue[mHead]
        mHead += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            let nt = dist[y][x] + 1
            
            if ny < 0 || ny >= h || nx < 0 || nx >= w { return nt }
            if section[ny][nx] == "#" { continue }
            if dist[ny][nx] != -1 { continue }
            if nt >= fireTime[ny][nx] && fireTime[ny][nx] != -1 { continue }
            dist[ny][nx] = nt
            mainQueue.append((ny, nx))
            
        }
    }
    
    
    return -1
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let inputWH = readLine()!.split(separator: " ").map{ Int($0)! }
    let W = inputWH[0], H = inputWH[1]
    
    var section = Array(repeating: [Character](), count: H)
    
    for i in 0..<H {
        let input = Array(readLine()!)
        
        section[i] = input
    }
    
    var startX = 0, startY = 0
    
    for i in 0..<H {
        for j in 0..<W {
            if section[i][j] == "@" {
                startY = i
                startX = j
            }
        }
    }
    
    let result = bfs(startY: startY, startX: startX, section: section)
    
    if result == -1 {
        print("IMPOSSIBLE")
    } else {
        print(result)
    }
}