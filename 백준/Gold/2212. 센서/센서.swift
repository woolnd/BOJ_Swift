//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!

var sensors = readLine()!.split(separator: " ").map { Int($0)! }

if K >= N {
    print(0)
    exit(0)
}

sensors.sort()

var diff: [Int] = []

for i in 1..<N {
    diff.append(sensors[i] - sensors[i - 1])
}

diff.sort(by: >)

let result = diff.dropFirst(K - 1).reduce(0, +)

print(result)