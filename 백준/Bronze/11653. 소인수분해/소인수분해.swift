//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var N = Int(readLine()!)!

if N == 1 { exit(0) }

var i = 2
while i * i <= N {
    while N % i == 0 {
        print(i)
        N /= i
    }
    
    i += 1
}

if N > 1 {
    print(N)
}
