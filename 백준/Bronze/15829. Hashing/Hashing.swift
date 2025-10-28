//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let L = Int(readLine()!)!
let a = readLine()!.map{ String($0) }
let M = 1234567891
let r = 31

var result = 0

for i in 0..<L {
    let ascii = Int(Character(a[i]).asciiValue! - Character("a").asciiValue! + 1)
    
    result += ascii * Int(pow(Double(r), Double(i)))
}

if result < M {
    print(result)
} else {
    print(result / M)
}