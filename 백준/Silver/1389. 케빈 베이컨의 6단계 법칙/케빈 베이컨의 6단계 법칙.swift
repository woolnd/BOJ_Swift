//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]
var list = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    
    list[a].append(b)
    list[b].append(a)
}


func bfs(start: Int) -> Int {
    var visited = Array(repeating: false, count: N + 1)
    var dist    = Array(repeating: 0,     count: N + 1)
    
    var head = 0
    
    var queue = [start]
    visited[start] = true
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
        
        for next in list[cur] {
            if visited[next] { continue }
            
            visited[next] = true
            dist[next] = dist[cur] + 1
            queue.append(next)
        }
    }
    
    return dist.reduce(0, +)
}

var answerPerson = 0
var answerValue = Int.max

for i in 1...N {  
    let sum = bfs(start: i)
    if sum < answerValue {
        answerValue = sum
        answerPerson = i
    }
}

print(answerPerson)
