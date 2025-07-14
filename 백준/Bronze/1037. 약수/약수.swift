//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var count = Int(readLine()!)!
var list: [Int] = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

list.sort()

let result = list[0] * list[count - 1]
print(result)