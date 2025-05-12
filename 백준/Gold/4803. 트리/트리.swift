//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var caseNumber = 1

while true {
    let input = readLine()!.split(separator: " ")
    let n = Int(input[0])!
    let m = Int(input[1])!
    
    if n == 0 && m == 0 { break }
    
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let inputEdge = readLine()!.split(separator: " ")
        let a = Int(inputEdge[0])!
        let b = Int(inputEdge[1])!
        
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var visited = Array(repeating: false, count: n + 1)
    var treeCount = 0
    
    var nodeCount = 0
    var edgeCount = 0

    func DFS(_ current: Int, _ parent: Int) -> Bool {
        visited[current] = true
        nodeCount += 1

        for next in graph[current] {
            edgeCount += 1
            if !visited[next] {
                if !DFS(next, current) {
                    return false
                }
            } else if next != parent {
                return false
            }
        }
        return true
    }
    
    for i in 1...n {
        if !visited[i] {
            nodeCount = 0
            edgeCount = 0
            if DFS(i, -1) {
                if edgeCount / 2 == nodeCount - 1 {
                    treeCount += 1
                }
            }
        }
    }
    
    // 결과 출력
    if treeCount == 0 {
        print("Case \(caseNumber): No trees.")
    } else if treeCount == 1 {
        print("Case \(caseNumber): There is one tree.")
    } else {
        print("Case \(caseNumber): A forest of \(treeCount) trees.")
    }
    
    caseNumber += 1
}
