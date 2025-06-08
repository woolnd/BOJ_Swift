//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")

let N = Int(input[0])!
let S = Int(input[1])!

let list = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

var len = Int.max
var start = 0
var end = 0
var sum = 0

while true {
    if sum >= S {
        len = min(len, end - start)
        sum -= list[start]
        start += 1
    } else if end == N {
        break
    } else {
        sum += list[end]
        end += 1
    }
}

print(len == Int.max ? 0 : len)