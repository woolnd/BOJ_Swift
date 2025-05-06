//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var input = Int(readLine()!)!
var result: [Int] = []

if input == 0 {
    print(0)
} else {
    while input != 0 {
        var remain = input % -2
        var value = input / -2

        if remain < 0 {
            remain += 2
            value += 1
        }
        
        result.append(remain)
        input = value
    }

    print(result.reversed().map{ String($0) }.joined())
}