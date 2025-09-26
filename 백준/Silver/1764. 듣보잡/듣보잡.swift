//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

let N = inputCase[0], M = inputCase[1]

var list: [String : Int] = [:]

for _ in 0..<N {
    let input = readLine()!
    list[input] = 0
}

for _ in 0..<M {
    let input = readLine()!
    
    if list.keys.contains(input) {
        list[input] = 1
    } else {
        list[input] = 0
    }
}

let answer = list.filter { $0.value == 1 }.map { $0.key }.sorted()
print(answer.count)

for value in answer{
    print(value)
}