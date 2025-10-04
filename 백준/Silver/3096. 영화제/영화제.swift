//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let N = input[0], M = input[1]
var left = Array(repeating: [Int](), count: N)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    left[input[0] - 1].append(input[1] - 1)
}

var count = 0

for a in 0..<N {
    for b in (a+1)..<N {
        var i = 0, j = 0
        var common = 0
        let A = left[a].sorted()
        let B = left[b].sorted()

        while i < A.count && j < B.count {
            if A[i] == B[j] {
                common += 1
                i += 1
                j += 1
            } else if A[i] < B[j] {
                i += 1
            } else {
                j += 1
            }
        }

        if common >= 2 {
            count += common * (common - 1) / 2
        }
    }
}


print(count)