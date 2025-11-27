//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

func bfs(_ start: Int) -> [Int] {
    var dist = Array(repeating: -1, count: 101)
    var queue = [start]
    var idx = 0
    dist[start] = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        
        for n in 1...6 {
            let next = n + cur
            
            if next > 100 { continue }
            let move = (jump[next] == 0) ? next : jump[next]
            if dist[move] == -1 {
                dist[move] = dist[cur] + 1
                queue.append(move)
            }
        }
    }
    
    
    return dist
}

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }

var jump = Array(repeating: 0, count: 101)

for _ in 0..<inputNM[0] + inputNM[1] {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    jump[input[0]] = input[1]
}

let result = bfs(1)

print(result[100])