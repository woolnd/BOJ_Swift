//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    var start = Int(input[0]) ?? 0
    var end = Int(input[1]) ?? 0
    
    var isPrime: [Bool] = Array(repeating: true, count: end + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 1...Int(sqrt(Double(end))){
        if isPrime[i] {
            var j = 2
            
            while i * j <= end {
                isPrime[i * j] = false
                j += 1
            }
        }
    }
    
    for i in start...end {
        if isPrime[i]{
            print(i)
        }
    }
    
}