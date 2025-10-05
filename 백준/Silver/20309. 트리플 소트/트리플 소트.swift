//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{ Int($0)! }

var Ok: Bool = true

for i in 1...N {
    if (i % 2) != (list[i - 1] % 2) {
        Ok = false
        break
    }
}


print(Ok ? "YES" : "NO")