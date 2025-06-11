//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
var N = Int(input[0])!
var M = Int(input[1])!

var list: [(Int, Int)] = []

for _ in 0..<N {
    let inputList = readLine()!.split(separator: " ")
    let a = Int(inputList[0])!
    let b = Int(inputList[1])!
    
    list.append((a, b))
}


list.sort { $0.0 > $1.0 }

var result = 0
var idx = 0

while idx < N {
    if list[idx].1 >= list[idx].0 {
        idx += 1
        continue
    }
    
    let tripMax = list[idx].0
    var tripMin = list[idx].1
    
    var nextIdx = idx + 1
    
    while nextIdx < N && list[nextIdx].0 > tripMin {
        tripMin = min(tripMin, list[nextIdx].1)
        nextIdx += 1
    }
    
    result += (tripMax - tripMin) * 2
    
    idx = nextIdx
}

result += M
print(result)