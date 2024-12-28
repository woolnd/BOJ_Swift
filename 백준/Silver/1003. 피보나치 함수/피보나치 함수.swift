//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

var dpZero = [Int](repeating: 0, count: 41)
var dpOne = [Int](repeating: 0, count: 41)

dpZero[0] = 1
dpZero[1] = 0

dpOne[0] = 0
dpOne[1] = 1

for i in 2...40{
    dpZero[i] = dpZero[i - 1] + dpZero[i - 2]
    dpOne[i] = dpOne[i - 1] + dpOne[i - 2]
}

for _ in 0..<inputCase{
    let n = Int(readLine() ?? "0") ?? 0
    print("\(dpZero[n]) \(dpOne[n])")
}