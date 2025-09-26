//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let inputLevel = Array(readLine()!.split(separator: " ").map { String($0) })
var sortLevel = inputLevel

for i in 0..<N {
    let s = sortLevel[i]
    let tier = s.first!
    let num = Int(s.dropFirst())!
    let tierNum: String
    switch tier {
    case "B": tierNum = "5"
    case "S": tierNum = "4"
    case "G": tierNum = "3"
    case "P": tierNum = "2"
    case "D": tierNum = "1"
    default:  tierNum = "0"
    }
    let padded = String(format: "%04d", num)
    sortLevel[i] = tierNum + padded
}


sortLevel.sort(by: >)


for i in 0..<N {
    let s = sortLevel[i]
    let tierNum = s.first!
    let num = Int(s.dropFirst())!
    let tier: Character
    switch tierNum {
    case "5": tier = "B"
    case "4": tier = "S"
    case "3": tier = "G"
    case "2": tier = "P"
    case "1": tier = "D"
    default:  tier = "?"
    }
    sortLevel[i] = "\(tier)\(num)"
}


var diff: [String] = []
for i in 0..<N {
    if sortLevel[i] != inputLevel[i] {
        diff.append(inputLevel[i])
    }
}


if diff.isEmpty {
    print("OK")
} else {
    print("KO")

    let rank: [Character: Int] = ["B": 5, "S": 4, "G": 3, "P": 2, "D": 1]
    diff.sort {
        let t1 = rank[$0.first!]!, t2 = rank[$1.first!]!
        if t1 != t2 { return t1 > t2 }
        let n1 = Int($0.dropFirst())!, n2 = Int($1.dropFirst())!
        return n1 > n2
    }

    print(diff.prefix(2).joined(separator: " "))
}