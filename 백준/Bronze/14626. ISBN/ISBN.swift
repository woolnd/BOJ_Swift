//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.map{ String($0) }

var sum = 0
var checkIndex = 0
var result = 0

for (index, num) in input.enumerated() {
    if num != "*" {
        if index % 2 != 0 {
            sum += Int(num)! * 3
        } else {
            sum += Int(num)!
        }
    } else {
        checkIndex = index
    }
}

let weight = (checkIndex % 2 == 0) ? 1 : 3
let remainder = sum % 10

if weight == 1 {
    result = (10 - remainder) % 10
} else {
    let t = (10 - remainder) % 10
    result = (7 * t) % 10
}

print(result)
