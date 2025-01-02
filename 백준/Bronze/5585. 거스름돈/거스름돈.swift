//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputMoney = Int(readLine() ?? "0") ?? 0

var result = 1000 - inputMoney
var count = 0

while result != 0{
    if result >= 500 {
        result -= 500
    } else if result >= 100{
        result -= 100
    } else if result >= 50 {
        result -= 50
    } else if result >= 10 {
        result -= 10
    } else if result >= 5{
        result -= 5
    } else {
        result -= 1
    }
    count += 1
}

print(count)