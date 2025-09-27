//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list: [String: Int] = [:]

for _ in 0..<N {
    let input = readLine()!
    
    if list.keys.contains(input) {
        list[input]! += 1
    } else {
        list[input] = 1
    }
}

let maximum = list.values.max()
let result = list.filter{ $0.value == maximum }.map{ $0.key }.sorted()

print(result[0])
