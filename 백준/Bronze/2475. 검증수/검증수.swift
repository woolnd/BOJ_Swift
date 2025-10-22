//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNum = readLine()!.split(separator: " ").map{ Int($0)! }

var result = 0

for num in inputNum {
    result += Int(pow(Double(num), 2))
}

print(result % 10)