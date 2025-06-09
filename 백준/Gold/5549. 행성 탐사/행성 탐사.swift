//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")

let N = Int(input[0])!
let M = Int(input[1])!

let K = Int(readLine()!)!

var section: [[String]] = Array(repeating: Array(repeating: "0", count: M+1), count: N+1)
var prefixSection: [[(Int, Int, Int)]] = Array(repeating: Array(repeating: (0, 0, 0), count: M+1), count: N+1)


for i in 1...N {
    let inputSection = readLine()!.map { String($0) }
    
    section[i] = inputSection
}

for i in 1...N {
    for j in 1...M {
        let value: (Int, Int, Int)
        if section[i][j-1] == "J" {
            value = (1, 0, 0)
        } else if section[i][j-1] == "O" {
            value = (0, 1, 0)
        } else { // "I"
            value = (0, 0, 1)
        }
        
        let top = prefixSection[i-1][j]
        let left = prefixSection[i][j-1]
        let topleft = prefixSection[i-1][j-1]
        
        prefixSection[i][j] = (
            top.0 + left.0 - topleft.0 + value.0,
            top.1 + left.1 - topleft.1 + value.1,
            top.2 + left.2 - topleft.2 + value.2
        )
    }
}

for _ in 0..<K {
    let inputCase = readLine()!.split(separator: " ")
    let x1 = Int(inputCase[0])!
    let y1 = Int(inputCase[1])!
    let x2 = Int(inputCase[2])!
    let y2 = Int(inputCase[3])!
    
    let jSum = prefixSection[x2][y2].0 - prefixSection[x1-1][y2].0 - prefixSection[x2][y1-1].0 + prefixSection[x1-1][y1-1].0
    let oSum = prefixSection[x2][y2].1 - prefixSection[x1-1][y2].1 - prefixSection[x2][y1-1].1 + prefixSection[x1-1][y1-1].1
    let iSum = prefixSection[x2][y2].2 - prefixSection[x1-1][y2].2 - prefixSection[x2][y1-1].2 + prefixSection[x1-1][y1-1].2

    print(jSum, oSum, iSum)
}