//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var nodes: [[Int]] = Array(repeating: [], count: N + 1)

for _ in 0..<N - 1 {
    let inputNode = readLine()!.split(separator: " ")
    let aNode = Int(inputNode[0])!
    let bNode = Int(inputNode[1])!
    
    nodes[aNode].append(bNode)
    nodes[bNode].append(aNode)
}

var parents: [Int] = Array(repeating: 0, count: N + 1)
var queue = [1]
var visited: [Bool] = Array(repeating: false, count: N + 1)
visited[1] = true

while queue.count != 0 {
    let current = queue.removeFirst()
    
    for i in nodes[current] {
        if !visited[i] {
            parents[i] = current
            visited[i] = true
            queue.append(i)
        }
    }
}

for i in 2..<N+1{
    print(parents[i])
}