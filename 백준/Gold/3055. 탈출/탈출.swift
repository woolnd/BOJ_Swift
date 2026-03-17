//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let R = input[0], C = input[1]

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var map = Array(repeating: [Character](), count: R)

for i in 0..<R {
    let input = Array(readLine()!)
    map[i] = input
}

var D: (y: Int, x: Int) = (0, 0)
var S: (y: Int, x: Int) = (0, 0)
var water: [(y: Int, x: Int)] = []

for i in 0..<R {
    for j in 0..<C {
        if map[i][j] == "D" {
            D = (i, j)
        } else if map[i][j] == "S" {
            S = (i, j)
        } else if map[i][j] == "*" {
            water.append((i, j))
        }
    }
}


func bfs(D: (y: Int, x: Int), S: (y: Int, x: Int), water: [(y: Int, x: Int)]) -> Int {
    var water_time = Array(repeating: Array(repeating: Int.max, count: C), count: R)
    
    for i in water {
        water_time[i.y][i.x] = 0
    }
    
    var waterQueue: [(y: Int, x: Int)] = water
    var wIdx = 0
    
    while  wIdx < waterQueue.count {
        let cur = waterQueue[wIdx]
        wIdx += 1
        
        for i in 0..<4 {
            let ny = cur.y + dy[i]
            let nx = cur.x + dx[i]
            if ny < 0 || ny >= R || nx < 0 || nx >= C { continue }
            
            if (map[ny][nx] == "." || map[ny][nx] == "S") && water_time[ny][nx] == Int.max {
                water_time[ny][nx] = water_time[cur.y][cur.x] + 1
                waterQueue.append((ny, nx))
            }
        }
    }
    
    
    var visited = Array(repeating: Array(repeating: false, count: C), count: R)
    var queue: [(y: Int, x: Int, time: Int)] = [(S.y, S.x, 0)]
    var idx = 0
    
    while  idx < queue.count {
        let cur = queue[idx]
        idx += 1
        
        if cur.y == D.y && cur.x == D.x { return cur.time }
        
        for i in 0..<4 {
            let ny = cur.y + dy[i]
            let nx = cur.x + dx[i]
            
            if ny < 0 || ny >= R || nx < 0 || nx >= C { continue }
            if visited[ny][nx] || map[ny][nx] == "X" { continue }
            
            let nextTime = cur.time + 1
            
            if nextTime < water_time[ny][nx] {
                visited[ny][nx] = true
                queue.append((ny, nx, nextTime))
            }
        }
    }
    
    return -1
}

let result = bfs(D: D, S: S, water: water)

if result == -1 {
    print("KAKTUS")
} else {
    print(result)
}
