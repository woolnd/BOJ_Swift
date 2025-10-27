//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int($0)! }

var isPrime = Array(repeating: true, count: 1001)
var result = 0

isPrime[1] = false
isPrime[2] = true

for i in 2..<Int(sqrt(Double(1000))) + 1 {
    if isPrime[i] {
        var j = 2
        
        while i * j <= 1000 {
            isPrime[i * j] = false
            j += 1
        }
    }
}

for i in input {
    if isPrime[i] {
        result += 1
    }
}

print(result)