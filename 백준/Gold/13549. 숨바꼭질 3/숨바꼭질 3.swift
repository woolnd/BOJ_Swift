//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let MAX = 100000
let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], K = input[1]

if N >= K {
    print(N - K)
    exit(0)
}

let INF = Int.max / 4
var dist = Array(repeating: INF, count: MAX + 1)

func bfs(_ start: Int) {
    var deque = [Int]()
    var head = 0
    
    func pushFront(_ x: Int) {
        deque.insert(x, at: head)
    }
    
    func pushBack(_ x: Int) {
        deque.append(x)
    }
    
    dist[start] = 0
    pushBack(start)
    
    while head < deque.count {
        let now = deque[head]
        head += 1
        let nowDist = dist[now]
        
        let teleport = now * 2
        if teleport <= MAX && dist[teleport] > nowDist {
            dist[teleport] = nowDist
            pushFront(teleport)
        }
        
        let back = now - 1
        if back >= 0 && dist[back] > nowDist + 1 {
            dist[back] = nowDist + 1
            pushBack(back)
        }
        
        let forward = now + 1
        if forward <= MAX && dist[forward] > nowDist + 1 {
            dist[forward] = nowDist + 1
            pushBack(forward)
        }
    }
}

bfs(N)
print(dist[K])
