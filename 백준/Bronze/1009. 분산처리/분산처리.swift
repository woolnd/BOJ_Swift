//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation


var N = Int(readLine()!)!

for _ in 0..<N {
    let input = Array(readLine()!.split(separator: " ").map { Int(String($0))! })
    let a = input[0]
    let b = input[1]
    
    let base = a % 10
    
    var pattern: [Int] = []
    var visited = Set<Int>()
    var current = base
    
    while !visited.contains(current) {
        visited.insert(current)
        pattern.append(current)
        current = (current * base) % 10
    }
    
    let index = (b - 1) % pattern.count
    let result = pattern[index]
    
    print(result == 0 ? 10 : result)
}
