//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0
//var position: [(x1: Int, y1: Int, r1: Int, x2: Int, y2: Int, r2: Int)] = []
//position.append((x1: x1, y1: y1, r1: r1, x2: x2, y2: y2, r2: r2))
var results: [Int] = []

for _ in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == 6 {
        let x1 = Int(input[0]) ?? 0
        let y1 = Int(input[1]) ?? 0
        let r1 = Int(input[2]) ?? 0
        let x2 = Int(input[3]) ?? 0
        let y2 = Int(input[4]) ?? 0
        let r2 = Int(input[5]) ?? 0
        
        let dx = x2 - x1
        let dy = y2 - y1
        let distanceSquared = dx * dx + dy * dy
        let rSumSquared = (r1 + r2) * (r1 + r2)
        let rDiffSquared = (r1 - r2) * (r1 - r2)

        if distanceSquared == 0 && r1 == r2 {
            results.append(-1)
        } else if distanceSquared > rSumSquared || distanceSquared < rDiffSquared{
            results.append(0)
        } else if distanceSquared == rSumSquared || distanceSquared == rDiffSquared{
            results.append(1)
        } else {
            results.append(2)
        }
    }
}

for result in results{
    print(result)
}