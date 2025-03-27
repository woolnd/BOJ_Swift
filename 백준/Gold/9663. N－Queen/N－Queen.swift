//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "") ?? 0

var visited_col = Array(repeating: false, count: N)
var visited_up = Array(repeating: false, count: 2 * N)
var visited_down = Array(repeating: false, count: 2 * N)

var count = 0

func DFS(row: Int) {
    if row == N {
        count += 1
        return
    } else {
        for col in 0..<N {
            if !visited_col[col] && !visited_up[row + col] && !visited_down[row - col + N] {
                visited_col[col] = true
                visited_up[row + col] = true
                visited_down[row - col + N] = true
                
                DFS(row: row + 1)
                
                visited_col[col] = false
                visited_up[row + col] = false
                visited_down[row - col + N] = false
            }
        }
    }
}

DFS(row: 0)

print(count)