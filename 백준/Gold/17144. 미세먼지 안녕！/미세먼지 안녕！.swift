//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")

let R = Int(input[0])!
let C = Int(input[1])!
let T = Int(input[2])!

var section: [[Int]] = Array(repeating: Array(repeating: 0, count: C), count: R)
var cleanerPosition: [(Int, Int)] = []

for i in 0..<R {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    section[i] = intCol
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

for _ in 0..<T {
    var newSection = section
    
    for r in 0..<R {
        for c in 0..<C {
            if section[r][c] == -1 {
                continue
            } else if section[r][c] != 0 && section[r][c] != -1 {
                var count = 0
                for i in 0..<4 {
                    let ny = r + dy[i]
                    let nx = c + dx[i]
                    
                    if nx < 0 || nx >= C || ny < 0 || ny >= R {
                        continue
                    }
                    
                    if section[ny][nx] != -1 {
                        count += 1
                        newSection[ny][nx] += section[r][c] / 5
                    }
                }
                
                newSection[r][c] -= (section[r][c] / 5) * count
            }
        }
    }
    
    section = newSection
    
    if cleanerPosition.isEmpty {
        for r in 0..<R {
            if section[r][0] == -1 {
                cleanerPosition.append((r, 0))
            }
        }
    }
    
    let top = cleanerPosition[0].0
    let bottom = cleanerPosition[1].0
    
    //위쪽 공기청정기(반시계)
    for i in stride(from: top - 1, to: 0, by: -1) {
        section[i][0] = section[i - 1][0]
    }
    for i in 0..<C - 1 {
        section[0][i] = section[0][i + 1]
    }
    for i in 0..<top {
        section[i][C - 1] = section[i + 1][C - 1]
    }
    for i in stride(from: C - 1, to: 1, by: -1) {
        section[top][i] = section[top][i - 1]
    }
    section[top][1] = 0
    
    //아래쪽 공기청정기(시계)
    for i in stride(from: bottom + 1, to: R - 1, by: 1) {
        section[i][0] = section[i + 1][0]
    }
    for i in 0..<C - 1 {
        section[R - 1][i] = section[R - 1][i + 1]
    }
    for i in stride(from: R - 1, to: bottom, by: -1) {
        section[i][C - 1] = section[i - 1][C - 1]
    }
    for i in stride(from: C - 1, to: 1, by: -1) {
        section[bottom][i] = section[bottom][i - 1]
    }
    section[bottom][1] = 0
}

var countDust = 0

for r in 0..<R {
    for c in 0..<C {
        if section[r][c] != -1 {
            countDust += section[r][c]
        }
    }
}

print(countDust)