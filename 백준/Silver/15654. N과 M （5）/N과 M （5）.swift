//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var list = readLine()!.split(separator: " ").map{ Int($0)! }
list.sort(by: <)

var visited = Array(repeating: false, count: list.last! + 1)

var temp: [Int] = []
var result: [[Int]] = []

func backtrack() {
    if temp.count == M {
        result.append(temp)
        
        return
    }
    
    for num in list {
        if num == temp.last { continue }
        if visited[num] { continue }
        
        temp.append(num)
        visited[num] = true
        backtrack()
        temp.removeLast()
        visited[num] = false
    }
}

backtrack()

for num in result {
    print(num.map{ String($0) }.joined(separator: " "))
}