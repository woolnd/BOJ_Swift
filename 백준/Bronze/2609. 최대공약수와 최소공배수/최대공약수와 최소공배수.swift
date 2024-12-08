//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " ") {
    let inputNumberA = Int(input[0]) ?? 0
    let inputNumberB = Int(input[1]) ?? 0
    
    let gcf = GCF(inputA: inputNumberA, inputB: inputNumberB)
    let lcm = LCM(inputA: inputNumberA, inputB: inputNumberB, gcf: gcf)
    
    print(gcf)
    print(lcm)
}

/// 최대공약수 (GCF) 계산 - 유클리드 알고리즘
func GCF(inputA: Int, inputB: Int) -> Int {
    var A = inputA
    var B = inputB
    
    while B != 0 {
        let remainder = A % B
        A = B
        B = remainder
    }
    return A
}

/// 최소공배수 (LCM) 계산
func LCM(inputA: Int, inputB: Int, gcf: Int) -> Int {
    return (inputA * inputB) / gcf
}