//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!)

var first = Array(repeating: -1, count: 26)
var last = Array(repeating: -1, count: 26)

var count = 0

for (i, ch) in input.enumerated() {
    let idx = Int(ch.asciiValue! - 65)
    
    if first[idx] != -1 {
        last[idx] = i
    } else {
        first[idx] = i
    }
}

for i in 0..<26 {
    for j in i+1..<26 {
        let a1 = first[i]
        let b1 = first[j]
        
        let a2 = last[i]
        let b2 = last[j]
        
        if (a1 < b1 && b1 < a2 && a2 < b2) || (b1 < a1 && a1 < b2 && b2 < a2) {
            count += 1
        }
    }
}

print(count)