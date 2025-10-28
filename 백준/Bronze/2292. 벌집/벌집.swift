//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

if N == 1{
    print(1)
} else {
    var layer = 1
    var maxNum = 1
    var add = 6
    
    while N > maxNum {
        maxNum += add
        layer += 1
        add += 6
    }
    
    print(layer)
}