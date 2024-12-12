////
////  main.swift
////  BOJ
////
////  Created by wodnd on 9/16/24.
////
import Foundation

if let input = readLine()?.split(separator: " ") {
    let inputN = Int(input[0]) ?? 0
    let inputK = Int(input[1]) ?? 0
    
    var isPrimeNumber = [Bool](repeating: true, count: inputN + 1)
    isPrimeNumber[0] = false
    isPrimeNumber[1] = false
    
    var deleteCount = 0
    
    for i in 2...inputN {
        if isPrimeNumber[i] {
            var j = 1
            while i * j <= inputN {
                if isPrimeNumber[i * j] {
                    isPrimeNumber[i * j] = false
                    deleteCount += 1
                    
                    if deleteCount == inputK {
                        print(i * j)
                        break
                    }
                }
                j += 1
            }
        }
    }
}