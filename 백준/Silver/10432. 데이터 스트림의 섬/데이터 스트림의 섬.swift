//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine()!)!


func checkIsland(island: [Int]) -> Int {
    var count = 0
    
    for i in 1..<11 {
        if island[i] > island[i - 1] {
            var j = i
            var minInside = Int.max
            while j < 11 && island[j] > island[i - 1] {
                minInside = min(minInside, island[j])
                
                let right = island[j + 1]
                if right < minInside {
                    count += 1
                }
                j += 1
            }
        }
    }
    
    return count
}


for i in 0..<inputCase {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let island = Array(input.dropFirst())
    
    let result = checkIsland(island: island)
    print("\(i + 1) \(result)")
}