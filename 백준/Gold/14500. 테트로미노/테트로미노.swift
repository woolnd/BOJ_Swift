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

var papers = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let inputCol = readLine()!.split(separator: " ")
    let intCol = Array(inputCol.map{ Int(String($0))! })
    
    papers[i] = intCol
}

let tetromino: [[(Int, Int)]] = [
    [(0,0), (0,1), (0,2), (0,3)],
    [(0,0), (1,0), (2,0), (3,0)],
    
    [(0,0), (0,1), (1,0), (1,1)],
    
    [(0,0), (1,0), (2,0), (2,1)],
    [(1,0), (1,1), (1,2), (0,2)],
    [(0,0), (0,1), (1,1), (2,1)],
    [(0,0), (0,1), (0,2), (1,0)],
    [(0,1), (1,1), (2,1), (2,0)],
    [(0,0), (0,1), (0,2), (1,2)],
    [(0,0), (0,1), (1,0), (2,0)],
    [(0,0), (1,0), (1,1), (1,2)],
    
    [(0,1), (0,2), (1,0), (1,1)],
    [(0,0), (1,0), (1,1), (2,1)],
    [(0,0), (0,1), (1,1), (1,2)],
    [(0,1), (1,0), (1,1), (2,0)],
    
    [(0,0), (0,1), (0,2), (1,1)],
    [(0,0), (1,0), (2,0), (1,1)],
    [(0,1), (1,0), (1,1), (1,2)],
    [(0,1), (1,0), (1,1), (2,1)]
]

var maxSum = 0

for y in 0..<N {
    for x in 0..<M {
        for shape in tetromino {
            var sum = 0
            var isValid = true
            for (dy, dx) in  shape {
                let ny = y + dy
                let nx = x + dx
                
                if ny < 0 || ny >= N || nx < 0 || nx >= M {
                    isValid = false
                    continue
                }
                
                sum += papers[ny][nx]
            }
            
            
            if isValid{
                maxSum = max(maxSum, sum)
            }
        }
    }
}

print(maxSum)