//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = readLine()!.split(separator: " ")
let M = Int(inputCase[0]) ?? 0
let N = Int(inputCase[1]) ?? 0
let H = Int(inputCase[2]) ?? 0

var boxes: [[[Int]]] = Array(repeating: Array(repeating: [], count: N), count: H)

for z in 0..<H {
    for y in 0..<N {
        let input = readLine()!.split(separator: " ")
        let arrayInput = Array(input.map{ Int($0) ?? 0 })
        boxes[z][y] = arrayInput
    }
}

var check: Bool = true

for z in 0..<H {
    for y in 0..<N {
        for x in 0..<M {
            if boxes[z][y][x] == 0 {
                check = false
                break
            }
        }
        
        if !check { break }
    }
    
    if !check { break }
}

if check {
    print(0)
} else {
    print(BFS())
}



func BFS() -> Int {
    var queue: [(Int, Int, Int)] = []
    var head = 0
    
    for z in 0..<H {
        for y in 0..<N {
            for x in 0..<M {
                if boxes[z][y][x] == 1{
                    queue.append((z, y, x))
                }
            }
        }
    }
    
    let dx = [-1, 1, 0, 0, 0, 0]
    let dy = [0, 0, -1, 1, 0, 0]
    let dz = [0, 0, 0, 0, -1, 1]
    
    while head < queue.count {
        let (z, y, x) = queue[head]
        head += 1

        for i in 0..<dx.count{
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nz = z + dz[i]
            
            if nx < 0 || nx >= M || ny < 0 || ny >= N || nz < 0 || nz >= H || boxes[nz][ny][nx] != 0 {
                continue
            }
            
            if boxes[nz][ny][nx] == 0 {
                boxes[nz][ny][nx] = boxes[z][y][x] + 1
                queue.append((nz, ny, nx))
            }
        }
    }
    
    var maxDay = 0
    for z in 0..<H {
        for y in 0..<N {
            for x in 0..<M {
                if boxes[z][y][x] == 0{
                    return -1
                }
                
                maxDay = max(maxDay, boxes[z][y][x])
            }
        }
    }
    
    return maxDay - 1
}