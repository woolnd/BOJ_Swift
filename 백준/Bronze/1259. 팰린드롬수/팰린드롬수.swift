//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

while true {
    let N = readLine()!
    
    if N == "0" {
        exit(0)
    }
    
    var StringN = N.map{ String($0) }
    var count = StringN.count
    
    var front: [String] = []
    var back: [String] = []
    
    for i in 0..<count / 2 {
        front.append(StringN[i])
        back.append(StringN[count - i - 1])
    }
    
    if front == back {
        print("yes")
    } else {
        print("no")
    }
}