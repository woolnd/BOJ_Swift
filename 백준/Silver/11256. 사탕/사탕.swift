//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var inputCase = Int(readLine() ?? "0") ?? 0

while inputCase != 0{
    if let input = readLine()?.split(separator: " "){
        var candy = Int(input[0]) ?? 0
        let box = Int(input[1]) ?? 0
        
        var boxSizes = Array(repeating: 0, count: box)
        var result = 0
        
        for i in 0..<box{
            if let boxSize = readLine()?.split(separator: " "), boxSize.count == 2 {
                // 안전하게 Int 변환
                let width = Int(boxSize[0]) ?? 0
                let height = Int(boxSize[1]) ?? 0
                boxSizes[i] = width * height
            }
        }
        
        boxSizes.sort(by: >)
        
        for size in boxSizes{
            if candy > 0 {
                candy -= size
                result += 1
            } else {
                break
            }
        }
        
        print(result)
    }
    
    inputCase -= 1
}