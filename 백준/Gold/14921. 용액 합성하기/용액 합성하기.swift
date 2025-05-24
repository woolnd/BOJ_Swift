//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let A = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

var start = 0
var end = A.count - 1

var sum = Int.max


while start != end {
    let temp = A[start] + A[end]
    
    let sumA = abs(temp)
    let sumB = abs(sum)
    
    if sumA <= sumB {
        sum = temp
    }
    
    if temp < 0 {
        start += 1
    } else if temp > 0{
        end -= 1
    } else if temp == 0{
        break
    }
}

print(sum)
