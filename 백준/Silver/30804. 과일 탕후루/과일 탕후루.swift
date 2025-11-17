//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{ Int($0)! }
var left = 0
var count = Array(repeating: 0, count: 10) // 과일 종류 1~9
var kinds = 0
var answer = 0

for right in 0..<N {
    let fruit = list[right]
    if count[fruit] == 0 { kinds += 1 }
    count[fruit] += 1

    while kinds > 2 {
        let lf = list[left]
        count[lf] -= 1
        if count[lf] == 0 { kinds -= 1 }
        left += 1
    }

    answer = max(answer, right - left + 1)
}

print(answer)