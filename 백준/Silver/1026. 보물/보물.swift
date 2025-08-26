//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

let aList = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
let bList = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

let a_List = aList.sorted()
let order = (0..<N).sorted { bList[$0] > bList[$1] }

var placed = Array(repeating: 0, count: N)

for i in 0..<N {
    placed[order[i]] = a_List[i]
}

var sum = 0

for i in 0..<N {
    sum += placed[i] * bList[i]
}

print(sum)