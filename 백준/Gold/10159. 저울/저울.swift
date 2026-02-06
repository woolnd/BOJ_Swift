//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var heavierGraph = Array(repeating: [Int](), count: N + 1)
var lighterGraph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    
    lighterGraph[a].append(b)
    heavierGraph[b].append(a)
}

func bfs(_ start: Int, _ weight: [[Int]]) -> Int {
    var queue: [Int] = []
    queue.append(start)
    
    var visited = Array(repeating: false, count: N + 1)
    
    var idx = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        
        for i in weight[cur] {
            if visited[i] { continue }
            visited[i] = true
            queue.append(i)
        }
    }
    
    var cnt = 0
    for i in 1...N {
        if visited[i] == true {
            cnt += 1
        }
    }
    
    return cnt
}

for i in 1...N {
    let light = bfs(i, lighterGraph)
    let heavy = bfs(i, heavierGraph)
    
    let result = (N - 1) - (light + heavy)
    print(result)
}