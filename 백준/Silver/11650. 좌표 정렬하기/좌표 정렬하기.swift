//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0
var array: [(Int, Int)] = []

for _ in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == 2{
        array.append((Int(input[0])!, Int(input[1])!))
    }
}
array.sort { a, b in
    if a.0 == b.0 {
        return a.1 < b.1
    } else {
        return a.0 < b.0
    }
}

for (num1, num2) in array{
    print("\(num1) \(num2)")
}