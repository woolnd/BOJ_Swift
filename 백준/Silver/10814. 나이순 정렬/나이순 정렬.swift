//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNumber = Int(readLine() ?? "0") ?? 0

var joinArray: [(Int, String)] = []
for _ in 0..<inputNumber {
    if let input = readLine()?.split(separator: " "){
        joinArray.append((Int(input[0]) ?? 0, String(input[1])))
    }
}

joinArray.sort { a, b in
    return a.0 < b.0
}

for index in joinArray{
    print("\(index.0) \(index.1)")
}