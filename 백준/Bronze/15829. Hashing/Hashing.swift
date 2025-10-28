//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let L = Int(readLine()!)!
let a = readLine()!.map{ String($0) }
let M: Int64 = 1234567891
let r: Int64 = 31

var result: Int64 = 0
var power: Int64 = 1

for i in 0..<L {
    let ascii = Int(Character(a[i]).asciiValue! - Character("a").asciiValue! + 1)
    result = (result + Int64(ascii) * power) % M
    power = (power * r) % M
}

print(result)