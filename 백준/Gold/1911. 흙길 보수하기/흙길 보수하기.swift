//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let L = Int(input[1])!

var list: [(Int, Int)] = []

for _ in 0..<N {
    let inputList = readLine()!.split(separator: " ")
    
    let a = Int(inputList[0])!
    let b = Int(inputList[1])!
    
    list.append((a, b - 1))
}

list.sort { $0.0 < $1.0 }

var len = -1
var count = 0

list.forEach {
    if len < $0.0 {
        let s = $0.1-$0.0+1
        len = $0.0 + L*(s/L) + (s%L != 0 ? L : 0) - 1
        count += (s/L) + (s%L != 0 ? 1 : 0)
    } else {
        if $0.1 > len {
            let s = $0.1-len
            len = len + L*(s/L) + (s%L != 0 ? L : 0)
            count += s/L + (s%L != 0 ? 1 : 0)
        }
    }
}

print(count)