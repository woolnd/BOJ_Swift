//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
let N = inputNM[0]
let M = inputNM[1]

let dx = [-1, 0, 1]
let dy = [-1, 0, 1]

var A: [[Int]] = []
var B: [[Int]] = []

for i in 0..<N * 2{
    let input = Array(readLine()!.map{ Int(String($0))! })
    if i < N {
        A.append(input)
    } else {
        B.append(input)
    }
}

func flip(_ x: Int, _ y: Int) {
    for i in 0..<3 {
        for j in 0..<3 {
            A[x+i][y+j] ^= 1
        }
    }
}


var count = 0

if N >= 3 && M >= 3 {
    for i in 0..<(N-2) {
        for j in 0..<(M-2) {
            if A[i][j] != B[i][j] {
                flip(i, j)
                count += 1
            }
        }
    }
}

print(A == B ? count : -1)