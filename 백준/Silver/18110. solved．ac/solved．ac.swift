//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
if N == 0 {               
    print(0)
    exit(0)
}

var list: [Int] = []

for _ in 0..<N {
    let input = Int(readLine()!)!
    list.append(input)
}

list.sort(by: <)
var index = Double(N) * 0.15
index = round(index)

var sum = 0

for i in Int(index)..<N - Int(index) {
    sum += list[i]
}

var avg = Double(sum) / Double((N - (Int(index) * 2)))
avg = round(avg)

print(Int(avg))