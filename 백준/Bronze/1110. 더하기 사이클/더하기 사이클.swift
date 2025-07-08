//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var N: Int = Int(readLine()!)!
var temp = N
var count = 0

while true {
    count += 1
    
    let a = temp / 10
    let b = temp % 10
    let sum = a + b
    
    temp = (b * 10) + (sum % 10)
    if temp == N { break }
}

print(count)