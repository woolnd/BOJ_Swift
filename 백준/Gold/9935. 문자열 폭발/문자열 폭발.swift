//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let s = Array(readLine()!.utf8)
let bomb = Array(readLine()!.utf8)

var stack: [UInt8] = []
let m = bomb.count
let last = bomb[m - 1]

for ch in s {
    stack.append(ch)
    
    if last == ch && stack.count >= m {
        var isMatch = true
        let start = stack.count - m
        
        for i in 0..<m {
            if stack[start + i] != bomb[i] {
                isMatch = false
                break
            }
        }
        
        if isMatch {
            for _ in 0..<m { stack.removeLast() }
        }
    }
}

if stack.isEmpty {
    print("FRULA")
} else {
    print(String(bytes: stack, encoding: .utf8)!)
}