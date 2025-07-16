//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0)) })

let x = input[0]!
let y = input[1]!
let w = input[2]!
let h = input[3]!

var minX = min((x - 0), (w - x))
var minY = min((y - 0), (h - y))

var minResult = min(minX, minY)
print(minResult)