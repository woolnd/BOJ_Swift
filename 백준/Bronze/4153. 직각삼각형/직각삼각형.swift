//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

while true {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if input[0] == 0, input[1] == 0, input[2] == 0 {
        exit(0)
    }
    
    input.sort()
    
    let a = input[0] * input[0], b = input[1] * input[1], c = input[2] * input[2]
    
    if a + b == c {
        print("right")
    } else {
        print("wrong")
    }
}