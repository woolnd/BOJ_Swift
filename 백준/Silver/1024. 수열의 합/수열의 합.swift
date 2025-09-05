//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
let N = input[0], L = input[1]

var found = false

for len in L...100 {
    let t = N - len * (len - 1) / 2
    if t < 0 { break }
    
    if t % len == 0{
        let x = t / len
        
        let list = (0..<len).map{ String(x + $0) }
        print(list.joined(separator: " "))
        found = true
        
        break
    }
}

if !found { print(-1) }
