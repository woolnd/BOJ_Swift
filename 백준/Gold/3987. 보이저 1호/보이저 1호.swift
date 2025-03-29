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

var grids: [[String]] = Array(repeating: [], count: N)

for i in 0..<N {
    let inputCol = readLine()!
    let strCol = Array(inputCol.map{ String($0) })
    
    grids[i] = strCol
}

let inputPosition = readLine()!.split(separator: " ")
let PR = (Int(inputPosition[0]) ?? 1) - 1
let PC = (Int(inputPosition[1]) ?? 1) - 1

var visited_grids = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: M), count: N)
var maxTime = 0

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

let slashMirror = [1, 0, 3, 2]
let backSlashMirror = [3, 2, 1, 0]

var isVoyager: Bool = false

func DFS(_ y: Int, _ x: Int, _ dir: Int, _ time: Int){
    if visited_grids[y][x][dir] {
        isVoyager = true
        return
    }
    
    visited_grids[y][x][dir] = true
    maxTime = max(maxTime, time)
    
    let ny = y + dy[dir]
    let nx = x + dx[dir]
    
    if ny < 0 || ny >= N || nx < 0 || nx >= M {
        return
    }
    
    if grids[ny][nx] == "C" {
        return
    }
    
    var nd = dir
    
    if grids[ny][nx] == "/" {
        nd = slashMirror[dir]
    } else if grids[ny][nx] == "\\" {
        nd = backSlashMirror[dir]
    }
    
    DFS(ny, nx, nd, time + 1)
    visited_grids[y][x][dir] = false
}

let dirChar = ["U", "R", "D", "L"]
var answerDir = ""
var answerTime = -1

for i in 0..<4 {
    maxTime = 0
    visited_grids = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: M), count: N)
    DFS(PR, PC, i, 1)
    
    if isVoyager {
        answerDir = dirChar[i]
        break
    }
    
    if maxTime > answerTime {
        answerTime = maxTime
        answerDir = dirChar[i]
    }
}

print(answerDir)
print(isVoyager ? "Voyager" : "\(answerTime)")
