//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = readLine()!
var result = ""

if let first = Int(String(N.first!)) {
    result += String(first, radix: 2)
}

for i in N.dropFirst() {
    if let digit = Int(String(i)) {
        let binary = String(digit, radix: 2)
        
        result += String(repeating: "0", count: 3 - binary.count) + binary
    }
}

print(result)