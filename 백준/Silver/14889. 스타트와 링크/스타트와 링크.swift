//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0") ?? 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)


for i in 0..<N {
    if let input = readLine()?.split(separator: " "), input.count == N {
        for j in 0..<N{
            array[i][j] = Int(input[j]) ?? 0
        }
    }
}

var minGap = Int.max
var visited = Array(repeating: false, count: N)

func calculateDifference() {
    var startTeam = 0
    var linkTeam = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i] && visited[j] {
                startTeam += array[i][j]
            } else if !visited[i] && !visited[j] {
                linkTeam += array[i][j]
            }
        }
    }
    
    let gap = abs(startTeam - linkTeam)
    minGap = min(minGap, gap)
}

func divideTeam(index: Int, count: Int){
    if count == N / 2{
        calculateDifference()
        return
    }
    
    for i in index..<N{
        visited[i] = true
        divideTeam(index: i + 1, count: count + 1)
        visited[i] = false
    }
}

divideTeam(index: 0, count: 0)
print(minGap)