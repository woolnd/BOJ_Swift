//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

if let inputNumber = readLine()?.split(separator: " "), inputNumber.count == inputCase {
    let numberSet = Set(inputNumber) // O(N) (한 번만 수행됨)

    let checkCase = Int(readLine() ?? "0") ?? 0
    if let checkNumber = readLine()?.split(separator: " "), checkNumber.count == checkCase {
     
        for input in checkNumber {
            if numberSet.contains(input){
                print(1)
            } else {
                print(0)
            }
        }
    }
}