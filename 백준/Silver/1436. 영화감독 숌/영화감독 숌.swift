//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var number = 665
var count = 0


func hasTripleSix(x :Int) -> Bool {
    var n = x
    var streak = 0
    
    while n > 0 {
        if n % 10 == 6{
            streak += 1
            if streak == 3 { return true }
        } else {
            streak = 0
        }
        
        n /= 10
    }
    
    return false
}

while count < N {
    number += 1
    
    if hasTripleSix(x: number) { count += 1 }
}

print(number)