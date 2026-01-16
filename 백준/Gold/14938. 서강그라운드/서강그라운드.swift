//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNMR = readLine()!.split(separator: " ").map{ Int($0)! }
let n = inputNMR[0], m = inputNMR[1], r = inputNMR[2]

let items: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }

let INF = 1_000_000
var dist = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<r {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    
    dist[a][b] = min(dist[a][b], c)
    dist[b][a] = min(dist[b][a], c)
    
}


for i in 1...n {
    dist[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
        }
    }
}

var answer = 0

for i in 1...n {
    var sum = 0
    
    for j in 1...n {
        if dist[i][j] <= m {
            sum += items[j-1]
        }
    }
    
    answer = max(answer, sum)
}

print(answer)
