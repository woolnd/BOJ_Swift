//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], K = input[1]

var list = Array(1...N)
var current = 0

var checkList: [Int] = []

while !list.isEmpty{
    current += K - 1
    current %= list.count
    checkList.append(list[current])
    list.remove(at: current)
}

print("<\(checkList.map{ String($0) }.joined(separator: ", "))>")