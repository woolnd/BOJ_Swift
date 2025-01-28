//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 2{
    let n = Int(inputCase[0]) ?? 0
    let x = Int(inputCase[1]) ?? 0
    
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: 30), count: 30)
    
    for i in 0..<30 {
        array[i][0] = 1
        array[i][i] = 1
        
        if i >= 2{
            for j in 1..<30 {
                array[i][j] = array[i-1][j-1] + array[i-1][j]
            }
        }
    }
    
    print(array[n-1][x-1])
}