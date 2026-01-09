//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

let INF = 1_000_000_000
var dist = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for i in 1...n {
    dist[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    
    if c < dist[a][b] { dist[a][b] = c }
}

for k in 1...n {
    for i in 1...n {
        if dist[i][k] == INF { continue }
        for j in 1...n {
            if dist[k][j] == INF { continue }
            let cand = dist[i][k] + dist[k][j]
            if cand < dist[i][j] { dist[i][j] = cand }
        }
    }
}

var out = ""
for i in 1...n {
    for j in 1...n {
        out += (dist[i][j] == INF ? "0" : "\(dist[i][j])")
        out += (j == n ? "\n" : " ")
    }
}
print(out, terminator: "")