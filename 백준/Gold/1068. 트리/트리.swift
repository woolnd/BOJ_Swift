//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

let inputParents = readLine()!.split(separator: " ")
let parents = Array(inputParents.map{ Int(String($0))! })
let deleteNode = Int(readLine()!)!

var children = Array(repeating: [Int](), count: N)

var root = 0

for (child, parent) in parents.enumerated() {
    if parent == -1 {
        root = child
    } else {
        children[parent].append(child)
    }
}


var visited: [Bool] = Array(repeating: false, count: N)
var queue: [Int] = [deleteNode]
visited[deleteNode] = true

while queue.count != 0 {
    let node = queue.removeFirst()
    
    for child in children[node] {
        if !visited[child] {
            visited[child] = true
            queue.append(child)
        }
    }
}

var leafCount = 0

for i in 0..<N {
    if visited[i] {
        continue
    }
    
    var haveChild = false
    for child in children[i] {
        if !visited[child] {
            haveChild = true
            break
        }
    }
    
    if !haveChild {
        leafCount += 1
    }
}


print(leafCount)