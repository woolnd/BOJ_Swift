//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0")!
var section: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    section[i] = intCol
}

var sharkPosition: (Int, Int) = (0, 0)

for r in 0..<N {
    for c in 0..<N {
        if section[r][c] == 9 {
            sharkPosition = (r, c)
            section[r][c] = 0  
        }
    }
}

let dy = [0, 0, -1, 1]
let dx = [-1, 1, 0, 0]

var queue: [(Int, Int)] = []

for r in 0..<N {
    for c in 0..<N {
        if section[r][c] != 0 &&  section[r][c] != 9 {
            queue.append((r, c))
        }
    }
}


var sharkSize = 2
var eatCount = 0
var totalTime = 0

func BFS(_ start: (Int, Int)) -> (Int, Int, Int)? {
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var queue: [(Int, Int, Int)] = [ (start.0, start.1, 0) ]
    visited[start.0][start.1] = true
    var candidates: [(Int, Int, Int)] = []
    
    var idx = 0
    while idx < queue.count {
        let (y, x, dist) = queue[idx]
        idx += 1
        
        for d in 0..<4 {
            let ny = y + dy[d]
            let nx = x + dx[d]
            
            if ny < 0 || ny >= N || nx < 0 || nx >= N { continue }
            if visited[ny][nx] || section[ny][nx] > sharkSize { continue }
            
            visited[ny][nx] = true
            if section[ny][nx] != 0 && section[ny][nx] < sharkSize {
                candidates.append((ny, nx, dist + 1))
            }
            
            queue.append((ny, nx, dist + 1))
        }
    }
    
    if candidates.isEmpty { return nil }
    
    // 우선순위 정렬: 거리 → 위쪽 → 왼쪽
    candidates.sort {
        if $0.2 != $1.2 { return $0.2 < $1.2 }
        if $0.0 != $1.0 { return $0.0 < $1.0 }
        return $0.1 < $1.1
    }
    
    return candidates.first
}

while true {
    if let target = BFS(sharkPosition) {
        let (ty, tx, dist) = target
        sharkPosition = (ty, tx)
        totalTime += dist
        section[ty][tx] = 0
        eatCount += 1
        
        if eatCount == sharkSize {
            sharkSize += 1
            eatCount = 0
        }
    } else {
        break
    }
}

print(totalTime)