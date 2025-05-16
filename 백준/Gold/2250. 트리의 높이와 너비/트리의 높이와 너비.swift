//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N + 1)
var isChild = Array(repeating: false, count: N + 1)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = input[0], left = input[1], right = input[2]
    
    graph[parent].append(left)
    graph[parent].append(right)
    if left != -1 { isChild[left] = true }
    if right != -1 { isChild[right] = true }
}
let root = (1...N).first { !isChild[$0] }!

var column = 1
var levelMinMax: [Int: (min: Int, max: Int)] = [:]

func inorder(_ node: Int, _ level: Int) {
    if node == -1 { return }
    
    inorder(graph[node][0], level + 1)
    
    if levelMinMax[level] == nil {
        levelMinMax[level] = (column, column)
    } else {
        levelMinMax[level]!.min = min(levelMinMax[level]!.min, column)
        levelMinMax[level]!.max = max(levelMinMax[level]!.max, column)
    }
    column += 1
    
    inorder(graph[node][1], level + 1)
}

inorder(root, 1)


var resultLevel = 0
var resultWidth = 0

for (level, (minCol, maxCol)) in levelMinMax {
    let width = maxCol - minCol + 1
    if width > resultWidth || (width == resultWidth && level < resultLevel) {
        resultLevel = level
        resultWidth = width
    }
}

print(resultLevel, resultWidth)