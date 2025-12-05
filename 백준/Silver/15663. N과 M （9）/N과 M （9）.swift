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

var visited = Array(repeating: 0, count: list.last! + 1)

for num in list {
    visited[num] += 1
}

var temp: [Int] = []
var result: [[Int]] = []

func backtrack() {
    if temp.count == M {
        if !result.contains(temp) {
            result.append(temp)
        }
        
        return
    }
    
    var last = 0
     
    for num in list {
        if visited[num] == 0 { continue }
        if num == last { continue }
        
        last = num
        
        temp.append(num)
        visited[num] -= 1
        backtrack()
        temp.removeLast()
        visited[num] += 1
    }
}

backtrack()

for num in result {
    print(num.map{ String($0) }.joined(separator: " "))
}