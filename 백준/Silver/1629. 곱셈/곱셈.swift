//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 3{
    let A = Int(inputCase[0]) ?? 0
    let B = Int(inputCase[1]) ?? 0
    let C = Int(inputCase[2]) ?? 0
    
    print(Solution(a: A, b: B, c: C))
}

func Solution(a: Int, b: Int, c: Int) -> Int{
    if b == 1{
        return a % c
    }
    
    let temp = Solution(a: a, b: Int(b / 2), c: c)
    
    if b % 2 == 1{
        return ((temp * temp) % c * a) % c
    } else {
        return (temp * temp) % c
    }
}