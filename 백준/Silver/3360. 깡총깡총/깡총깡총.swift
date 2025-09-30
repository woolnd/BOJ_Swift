//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let n = Int(readLine()!)!
let MOD = 1_000_000

let k =  n / 3                       // c의 최댓값

let evenCount = k / 2 + 1           // 짝수 c 개수
let te = evenCount - 1              // t의 최대값
let sumEven = evenCount * (n / 2)   // Σ ⌊N/2⌋
              - 3 * (te * (te + 1) / 2)  // Σ 3t

let oddCount = (k + 1) / 2          // 홀수 c 개수
let to = oddCount - 1
let baseOdd = (n >= 3) ? ((n - 3) / 2) : 0
let sumOdd = (oddCount > 0)
    ? oddCount * baseOdd - 3 * (to * (to + 1) / 2)
    : 0

let total = (k + 1) + sumEven + sumOdd

print(total % MOD)
