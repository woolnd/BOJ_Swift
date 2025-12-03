//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }

let N = inputNM[0], M = inputNM[1]

var result: [[Int]] = []
var temp: [Int] = []

func backtrack() {
    if temp.count == M {
        result.append(temp)
        
        return
    }
    
    for i in 1...N {
        if let last = temp.last, last > i { continue }
        temp.append(i)
        
        backtrack()
        
        temp.removeLast()
    }
}

backtrack()

for num in result {
    print(num.map{ String($0) }.joined(separator: " "))
}