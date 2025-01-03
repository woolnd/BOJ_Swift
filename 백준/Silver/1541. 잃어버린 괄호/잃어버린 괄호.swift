//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine() ?? ""
let inputToString = input.map{ String($0) }
let splitMinus = inputToString.split(separator: "-")

var result = 0

var x = splitMinus[0].split(separator: "+").map { slice in
    Int(slice.joined()) ?? 0
}.reduce(0, +)

if inputToString[0] == "-"{
    result -= x
} else {
    result += x
}

for i in 1..<splitMinus.count{
    x = splitMinus[i].split(separator: "+").map { slice in
        Int(slice.joined()) ?? 0
    }.reduce(0, +)
    
    result -= x
}

print(result)