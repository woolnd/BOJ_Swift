//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "){
    let coinType = Int(input[0]) ?? 0
    var sum = Int(input[1]) ?? 0
    var result = 0
    
    var type: [Int] = []
    
    for _ in 0..<coinType{
        type.append(Int(readLine() ?? "0") ?? 0)
    }
    
    for i in stride(from: coinType - 1, through: 0, by: -1) {
        while( sum >= type[i] ){
            sum -= type[i]
            result += 1
        }
    }
    
    print(result)
}