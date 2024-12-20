//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let maxLimit = 1_000_000 // 문제에서 제시된 최대값
var isPrimeNumber = [Bool](repeating: true, count: maxLimit + 1)
isPrimeNumber[0] = false
isPrimeNumber[1] = false

for i in 1...Int(sqrt(Double(maxLimit))){
    if isPrimeNumber[i] {
       var j = 2
        while i * j <= maxLimit {
            isPrimeNumber[i * j] = false

            j += 1
        }
    }
}

while let input = readLine(), let inputNumber = Int(input), inputNumber != 0 {
    var found = false
    for i in 3...inputNumber / 2 {
        if isPrimeNumber[i] && isPrimeNumber[inputNumber - i] {
            print("\(inputNumber) = \(i) + \(inputNumber - i)")
            found = true
            break
        }
    }
    
    if !found {
        print("Goldbach's conjecture is wrong.")
    }
}