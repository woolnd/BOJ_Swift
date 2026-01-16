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
var dist = Array(repeating: -1, count: max + 1)
var count = Array(repeating: 0, count: max + 1)

var queue = [N]
dist[N] = 0
count[N] = 1

var idx = 0

while idx < queue.count {
    let x = queue[idx]
    idx += 1

    if x == K {
        print(dist[K])
        print(count[K])
        break
    }

    for nx in [x-1, x+1, x*2] {
        if nx >= 0 && nx <= max {
            if dist[nx] == -1 {
                dist[nx] = dist[x] + 1
                count[nx] = count[x]
                queue.append(nx)
                
            } else if dist[nx] == dist[x] + 1{
                count[nx] += count[x]
            }
        }
    }
}
