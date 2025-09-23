//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var list = [64]
let X = Int(readLine()!)!

while list.reduce(0, +) > X {
    var temp = list.removeLast()
    temp /= 2
    
    if list.reduce(0, +) + temp >= X {
        list.append(temp)
    } else {
        list.append(temp)
        list.append(temp)
    }
}

print(list.count)