//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let F = Int(readLine()!)!

var front = (N / 100) * 100
var index = 0

while index <= 99 {
    if index < 10 {
        let temp = front + index
        if temp % F == 0{
            print("0\(index)")
            break
        }
    } else {
        let temp = front + index
        
        if temp % F == 0{
            print(index)
            break
        }
    }
    
    
    index += 1
}