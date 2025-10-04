//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0], M = first[1], K = first[2]

var state = Array(repeating: false, count: N)

for _ in 0..<M {
    let idx = Int(readLine()!)!
    state[idx] = true
}

func jump(_ s: [Bool], by dRaw: Int) -> [Bool] {
    if dRaw % N == 0 { return Array(repeating: false, count: N) }
    let d = dRaw % N
    var next = Array(repeating: false, count: N)
    for i in 0..<N {
        let left  = s[(i - d + N) % N]
        let right = s[(i + d) % N]
        next[i] = (left != right)
    }
    return next
}


if K > 0 {
    var bit = 0
    var k = K
    while k > 0 {
        if (k & 1) == 1 {
            state = jump(state, by: 1 << bit)
        }
        bit += 1
        k >>= 1
    }
}

print(state.reduce(0) { $0 + ($1 ? 1 : 0) })