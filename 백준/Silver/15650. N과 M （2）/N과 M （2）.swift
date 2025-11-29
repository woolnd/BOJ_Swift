//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var visited = Array(repeating: false, count: N + 1)
var result: [[Int]] = []
var temp: [Int] = []

func backtrack() {
    if temp.count == M {
        result.append(temp)
        return
    }
    
    for i in 1...N {
        if visited[i] { continue }
        if let last = temp.last, last > i { continue }
        visited[i] = true
        temp.append(i)
        
        backtrack()
        
        visited[i] = false
        temp.removeLast()
    }
}

backtrack()

for temp in result {
    print(temp.map{ String($0) }.joined(separator: " "))
}