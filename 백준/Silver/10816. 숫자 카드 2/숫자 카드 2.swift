//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let card = readLine()!.split(separator: " ").map{ Int(String($0))! }

let M = Int(readLine()!)!
let checkCard = readLine()!.split(separator: " ").map{ Int(String($0))! }

let max = card.max()!
let min = card.min()!

var list: [Int] = Array(repeating: 0, count: max - min + 1)

for num in card {
    list[num - min] += 1
}

var result: [Int] = []

for num in checkCard {
    if num < min || num > max {
        result.append(0)
    } else {
        result.append(list[num - min])
    }
}

print(result.map{ String($0) }.joined(separator: " "))