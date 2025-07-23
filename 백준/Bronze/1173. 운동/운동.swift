//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
var N = input[0]
var m = input[1]
var M = input[2]
var T = input[3]
var R = input[4]
var count = 0

while true {
    if m + T > M && m == input[1] {
        count = -1
        break
    } else if m + T <= M {
        m += T
        N -= 1
    } else {
        m = max(m - R, input[1])
    }
    
    count += 1
    
    if N == 0 { break }
}

print(count)
