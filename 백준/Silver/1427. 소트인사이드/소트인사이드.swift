//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine() {
    let inputNumber = Array(input)
    let intputNumbers = inputNumber.compactMap { Int(String($0)) }
        

    let result = intputNumbers.sorted(by: >)
    
    print(result.map{ String($0) }.joined())
}