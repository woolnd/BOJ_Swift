//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let MOD: Int64 = 1_000_000_007
let n = Int64(readLine()!)!


func fibo(_ n: Int64) -> (Int64, Int64) {
    if n == 0 { return (0, 1) }
    
    let (a, b) = fibo(n >> 1)
    
    let twoBMinusA = (2 * b % MOD - a + MOD) % MOD
    let c = (a * twoBMinusA) % MOD
    let d = (a * a % MOD + b * b % MOD) % MOD
    
    if n % 2 == 0 {
        return (c, d)
    } else {
        return (d, (c + d) % MOD)
    }
}

print(fibo(n).0)