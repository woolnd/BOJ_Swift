//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

var K = input[1]
var I = input[2]

var round = 0

while K != I {
    K = (K + 1) / 2
    I = (I + 1) / 2
    
    round += 1
}

print(round)