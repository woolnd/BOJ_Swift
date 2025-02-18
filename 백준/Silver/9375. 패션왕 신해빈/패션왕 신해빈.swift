//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "0") ?? 0

for _ in 0..<input {
    let clothesCase = Int(readLine() ?? "0") ?? 0
    
    var clothes: [String: Int] = [:]
    
    for _ in 0..<clothesCase {
        if let inputClothes = readLine()?.split(separator: " "), inputClothes.count == 2{
            let category = String(inputClothes[1])
            clothes[category, default: 0] += 1
        }
    }
    
    var count = 1
    
    for value in clothes.values {
        count *= (value + 1)
    }
    
    print(count - 1)
}