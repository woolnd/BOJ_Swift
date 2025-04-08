//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = readLine()!.split(separator: " ")

let N = Int(inputCase[0]) ?? 0
let M = Int(inputCase[1]) ?? 0

var spaces: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    spaces[i] = intCol
}

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

var maxValue = 0

var emptySpace: [(Int, Int)] = []
checkEmptySpace(&spaces, &emptySpace)
var newWalls = combination(emptySpace, choose: 3)

for wall in newWalls {
    guard wall.count == 3 else { continue }
    
    var newSpaces = spaces
    
    for i in 0..<3 {
        let y = wall[i].0
        let x = wall[i].1
        
        newSpaces[y][x] = 1
    }
    
    for y in 0..<N {
        for x in 0..<M {
            if newSpaces[y][x] == 2 {
                solution(&newSpaces, y, x)
            }
        }
    }
    
    let count = countEmptySpace(newSpaces)
    maxValue = max(maxValue, count)
}

print(maxValue)

func checkEmptySpace(_ spaces: inout [[Int]], _ emptySpace: inout [(Int, Int)]) {
    for i in 0..<N {
        for j in 0..<M {
            if spaces[i][j] == 0 {
                emptySpace.append((i, j))
            }
        }
    }
}

func combination<T>(_ array: [T], choose: Int) -> [[T]] {
    if choose == 0 { return [[]] }
    if array.isEmpty { return [[]] }
    
    var result: [[T]] = []
    let rest = Array(array[1...])
    
    for comb in combination(rest, choose: choose - 1){
        result.append([array[0]] + comb)
    }
    
    result += combination(rest, choose: choose)
    
    return result
}

func solution(_ array: inout [[Int]], _ y: Int, _ x: Int) {
    var queue: [(Int, Int)] = [(y, x)]
    
    while queue.count != 0 {
        let (y, x) = queue.removeFirst()
        
        for i in 0..<4{
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= N || nx < 0 || nx >= M {
                continue
            }
            
            if array[ny][nx] == 0{
                array[ny][nx] = 2
                
                queue.append((ny, nx))
            }
        }
    }
}

func countEmptySpace(_ array: [[Int]]) -> Int {
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            if array[i][j] == 0 {
                count += 1
            }
        }
    }
    return count
}