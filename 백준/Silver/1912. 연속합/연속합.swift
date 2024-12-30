//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

if let input = readLine()?.split(separator: " "), input.count == inputCase {
    let inputNumber = input.map{ Int($0) ?? 0 }
    
    var maxSum = inputNumber[0] // 최대 부분합
    var currentSum = inputNumber[0] // 현재 부분합
    
    //카데인 알고리즘 활용
    for i in 1..<inputCase {
        currentSum = max(inputNumber[i], currentSum + inputNumber[i])
        maxSum = max(maxSum, currentSum)
    }
    
    print(maxSum)
}