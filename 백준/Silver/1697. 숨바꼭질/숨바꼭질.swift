//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input =  readLine()!.split(separator: " ").map{ Int($0)! }

let N = input[0], K = input[1]

let max = 100000
var visited = Array(repeating: false, count: max + 1)
var dist = Array(repeating: 0, count: max + 1)

var queue = [N]
visited[N] = true

var idx = 0

while idx < queue.count {
    let x = queue[idx]
    idx += 1
    
    if x == K {
        print(dist[K])
        break
    }
    
    for nx in [x-1, x+1, x*2] {
        if nx >= 0 && nx <= max && !visited[nx] {
            visited[nx] = true
            dist[nx] = dist[x] + 1
            
            queue.append(nx)
        }
    }
}
