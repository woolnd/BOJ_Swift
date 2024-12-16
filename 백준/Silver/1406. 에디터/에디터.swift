////
////  main.swift
////  BOJ
////
////  Created by wodnd on 9/16/24.
////
import Foundation

var left: [Character] = Array(readLine()!)
var right: [Character] = []
let inputCount = Int(readLine()!)!

for _ in 0..<inputCount {
    let command = readLine()!
    
    switch command {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(command.last!)
    }
}
print(String(left + right.reversed()))