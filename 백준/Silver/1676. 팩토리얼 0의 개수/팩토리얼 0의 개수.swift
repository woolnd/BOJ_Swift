//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var count = 0

if N == 0 {
    print(0)
    exit(0)
}

for i in 1...N {
    var check = i
    
    while check % 5 == 0{
        count += 1
        check /= 5
    }
}

print(count)