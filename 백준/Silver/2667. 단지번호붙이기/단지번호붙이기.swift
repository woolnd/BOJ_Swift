//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0") ?? 0
var maps: [[Int]] = Array(repeating: [], count: N)

for i in 0..<N {
    if let inputMaps = readLine() {
        let row = inputMaps.map { Int(String($0)) ?? 0 } // 문자 하나씩 변환
        if row.count == N { // 입력 개수 확인
            maps[i] = row
        }
    }
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var resultCount: [Int] = []

func DFS(X: Int, Y: Int) -> Int{
    if X < 0 || X >= N || Y < 0 || Y >= N || maps[X][Y] == 0{
        return 0
    }
    
    maps[X][Y] = 0
    var size = 1
    
    for i in 0..<4{
        let nx = X + dx[i]
        let ny = Y + dy[i]
        
        size += DFS(X: nx, Y: ny)
    }
    
    return size
}

for i in 0..<N {
    for j in 0..<N{
        if maps[i][j] == 1{
            resultCount.append(DFS(X: i, Y: j))
        }
    }
}

print(resultCount.count)
for i in resultCount.sorted() {
    print(i)
}