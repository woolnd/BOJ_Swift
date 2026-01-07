//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{ Int($0)! }


var inc: [Int] = Array(repeating: 1, count: N)
var dec: [Int] = Array(repeating: 1, count: N)

for i in 0..<N {
    for j in 0..<i {
        if A[j] < A[i] {
            inc[i] = max(inc[i], inc[j] + 1)
        }
    }
}

for i in stride(from: N-1, through: 0, by: -1){
    for j in stride(from: N-1, through: i, by: -1) {
        if A[j] < A [i] {
            dec[i] = max(dec[i], dec[j] + 1)
        }
    }
}

var reuslt = 0

for i in 0..<N {
    reuslt = max(reuslt, inc[i]+dec[i] - 1)
}

print(reuslt)