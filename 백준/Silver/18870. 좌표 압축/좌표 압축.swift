//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var sortList = input

sortList.sort(by: <)

var dict: [Int : Int] = [:]

var sort = 0

for num in sortList {
    if !dict.keys.contains(num) {
        dict[num] = sort
        sort += 1
    }
}
var result: [Int] = []

for num in input {
    result.append(dict[num]!)
}

print(result.map{ String($0) }.joined(separator: " "))
