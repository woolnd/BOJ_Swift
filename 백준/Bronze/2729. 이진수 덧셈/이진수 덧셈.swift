//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ")
    let A = input[0]
    let B = input[1]
    
    let maxLength = max(A.count, B.count)
    var paddedA = String(repeating: "0", count: maxLength - A.count) + A
    var paddedB = String(repeating: "0", count: maxLength - B.count) + B
    
    var result: [String] = []
    var carry: Int = 0
    
    while !paddedA.isEmpty && !paddedB.isEmpty {
        let a = Int(String(paddedA.removeLast()))!
        let b = Int(String(paddedB.removeLast()))!
        
        let sum = a + b + carry
        result.append(String(sum % 2))
        carry = sum / 2
    }
    
    if carry > 0 {
        result.append("1")
    }
    
    let finalResult = result.reversed().joined()
    
    // 앞의 0만 제거
    let trimmed: String
    if let firstOneIndex = finalResult.firstIndex(where: { $0 == "1" }) {
        trimmed = String(finalResult[firstOneIndex...])
    } else {
        trimmed = "0"
    }
    
    print(trimmed)
}