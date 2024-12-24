//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let caseCount = Int(readLine() ?? "0") ?? 0

var array: [(Int, Int)] = []

for _ in 0..<caseCount {
    if let input = readLine()?.split(separator: " "){
        let inputX = Int(input[0]) ?? 0
        let inputY = Int(input[1]) ?? 0
        
        array.append((inputX, inputY))
    }
}

let result =  array.sorted{
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    }
    return $0.0 < $1.0
}

for index in result{
    print("\(index.0) \(index.1)")
}