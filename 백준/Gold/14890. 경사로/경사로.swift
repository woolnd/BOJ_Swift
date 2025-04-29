//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let L = Int(input[1])!

var answer = 0

var maps: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

for r in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    maps[r] = intCol
}

func go(_ line: [Int]) -> Bool {
    var visited = Array(repeating: false, count: N)
    
    for i in 0..<N - 1{
        var diff = line[i+1] - line[i]
        
        if diff == 0 {
            continue
        } else if diff == 1{
            for j in stride(from: i, through: i-L+1, by: -1){
                if j < 0 || line[j] != line[i] || visited[j]{
                    return false
                }
                
                visited[j] = true
            }
        } else if diff == -1 {
            for j in i+1...i+L {
                if j >= N || line[j] != line[i+1] || visited[j]{
                    return false
                }
                
                visited[j] = true
            }
        } else { return false }
    }
    
    return true
}

//행
for r in 0..<N {
    if go(maps[r]) {
        answer += 1
    }
}

//열
for c in 0..<N {
    var line = [Int]()
    for r in 0..<N {
        line.append(maps[r][c])
    }
    if go(line) {
        answer += 1
    }
}

print(answer)