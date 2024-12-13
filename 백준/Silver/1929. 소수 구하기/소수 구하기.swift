////
////  main.swift
////  BOJ
////
////  Created by wodnd on 9/16/24.
////
import Foundation

if let input = readLine()?.split(separator: " "){
    let inputM = Int(input[0]) ?? 0
    let inputN = Int(input[1]) ?? 0
    
    var isPrimeNumber = [Bool](repeating: true, count: inputN + 1)
    isPrimeNumber[0] = false
    isPrimeNumber[1] = false
    
    for i in 1...Int(sqrt(Double(inputN))) {
        if isPrimeNumber[i] {
            var j = 2
            while i * j <= inputN {
                isPrimeNumber[i * j] = false
                j += 1
            }
        }
    }
    
    for i in inputM...inputN {
        if isPrimeNumber[i] {
            print(i)
        }
    }
}
