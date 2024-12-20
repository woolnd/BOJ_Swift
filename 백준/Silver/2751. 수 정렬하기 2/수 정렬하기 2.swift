//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var array: [Int] = []
    
    for i in 0..<inputNumber{
        array.append(Int(readLine() ?? "0") ?? 0)
    }
    
    var result = array.sorted()
    
    for number in result {
        print(number)
    }
}