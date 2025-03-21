//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let inputA = Int(input[0]) ?? 0
    let inputB = Int(input[1]) ?? 0
    
    let gcd = GCD(inputA, inputB)
    print(gcd)
    print(LSM(gcd, inputA, inputB))
    
    func GCD(_ inputA: Int, _ inputB: Int) -> Int{
        var a = inputA
        var b = inputB
        
        while b != 0 {
            let remainder = a % b
            a = b
            b = remainder
        }
        
        return a
    }
    
    func LSM(_ gcd: Int, _ inputA: Int, _ inputB: Int) -> Int{
        return (inputA * inputB) / gcd
    }
}