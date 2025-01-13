//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputTime = Int(readLine() ?? "0") ?? 0

var times: [[Int]] = []

for _ in 0..<inputTime {
    if let time = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
        times.append(time)
    }
}

times.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    }
    return $0[1] < $1[1]
}

var count = 0
var lastEndTime = 0

for time in times {
    if time[0] >= lastEndTime {
        count += 1
        lastEndTime = time[1]
    }
}

print(count)