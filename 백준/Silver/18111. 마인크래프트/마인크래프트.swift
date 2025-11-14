//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let N = input[0], M = input[1], B = input[2]

var hList = Array(repeating: [Int](), count: N)

var minH = 256
var maxH = 0

for i in 0..<N {
    let inputH = readLine()!.split(separator: " ").map{ Int($0)! }
    
    minH = min(minH, inputH.min()!)
    maxH = max(maxH, inputH.max()!)
    
    hList[i] = inputH
}

var bestTime = Int.max
var bestH = 0


for H in minH...maxH {
    var remove = 0
    var add = 0
    for i in 0..<N {
        for j in 0..<M {
            let h = hList[i][j]
            
            if h > H { remove += h - H }
            if h < H { add += H - h }
        }
    }
    
    if remove + B >= add {
        let time = (remove * 2) + add
        
        if time <= bestTime && bestH <= H{
            bestTime = time
            bestH = H
        }
    }
}

print("\(bestTime) \(bestH)")