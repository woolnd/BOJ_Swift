//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let MOD: Int64 = 1_000_000_007

func modPow(_ a: Int64, _ b: Int64) -> Int64 {
    var result: Int64 = 1
    var base = a % MOD
    var exp = b

    while exp > 0 {
        if exp & 1 == 1 {
            result = result * base % MOD
        }
        base = base * base % MOD
        exp >>= 1
    }
    return result
}

var answer: Int64 = 0

let M = Int(readLine()!)!

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let N = input[0], S = input[1]
    let invN = modPow(Int64(N), MOD - 2)
    answer = (answer + Int64(S) * invN) % MOD
}

print(answer)
