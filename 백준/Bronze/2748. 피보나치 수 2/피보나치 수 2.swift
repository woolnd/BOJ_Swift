//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNumber = Int(readLine() ?? "0") ?? 0

var fibo: [Int] = [0, 1]

if inputNumber != 0, inputNumber != 1{
    for i in 2...inputNumber{
        fibo.append(fibo[i-1] + fibo[i-2])
    }
}

if inputNumber == 0 {
    print(fibo[0])
} else if inputNumber == 1 {
    print(fibo[1])
} else {
    print(fibo.last ?? 0)
}
