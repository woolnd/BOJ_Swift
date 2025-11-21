//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!.map{ String($0) }

var i = 0
var count = 0
var result = 0

while i < M-2 {
    if S[i] == "I" && S[i+1] == "O" && S[i+2] == "I" {
        count += 1
        if count == N {
            result += 1
            count -= 1
        }
        i += 2
    } else {
        count = 0
        i += 1
    }
}

print(result)