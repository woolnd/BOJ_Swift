//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var list = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

for i in 1... {
    let count = list.filter { i % $0 == 0 }.count
    if count >= 3 {
        print(i)
        break
    }
}