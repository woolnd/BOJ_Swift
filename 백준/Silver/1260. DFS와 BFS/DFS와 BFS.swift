//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 3{
    let N = Int(inputCase[0]) ?? 0
    let M = Int(inputCase[1]) ?? 0
    let V = Int(inputCase[2]) ?? 0

    var visited_dfs = Array(repeating: false, count: N + 1)
    var visited_bfs = visited_dfs

    var graph: [[Int]] = Array(repeating: [], count: N + 1)

    for i in 1...M{
        if let input = readLine()?.split(separator: " "), input.count == 2{
            let node = input.compactMap{ Int($0) }

            graph[node[0]].append(node[1])
            graph[node[1]].append(node[0])
        }
    }

    DFS(v: V)
    print()
    BFS(v: V)
    print()

    func DFS(v: Int) {
        visited_dfs[v] = true
        print(v, terminator: " ")

        for i in graph[v].sorted() {
            if !visited_dfs[i]{
                DFS(v: i)
            }
        }

    }

    func BFS(v: Int) {
        visited_bfs[v] = true

        var queue: [Int] = [v]

        while queue.count != 0 {
            let v = queue.removeFirst()
            print(v, terminator: " ")

            for i in graph[v].sorted(){
                if !visited_bfs[i]{
                    queue.append(i)
                    visited_bfs[i] = true
                }
            }
        }

    }
}