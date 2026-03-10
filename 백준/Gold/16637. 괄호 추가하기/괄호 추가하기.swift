//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let input = Array(readLine()!)

var nums: [Int] = []
var ops: [Character] = []

for i in 0..<input.count {
    if input[i] == "+" || input[i] == "-" || input[i] == "*" {
        ops.append(input[i])
    } else {
        if let num = Int(String(input[i])) {
            nums.append(num)
        }
    }
}

var dist: [Int] = []

func dfs(index: Int, current: Int) {
    if index >= ops.count {
        dist.append(current)
        return
    }
    
    let res1 = calculate(current, ops[index], nums[index + 1])
    dfs(index: index + 1, current: res1)
    
    if index + 1 < ops.count {
        let bracket = calculate(nums[index + 1], ops[index + 1], nums[index + 2])
        let res2 = calculate(current, ops[index], bracket)
        dfs(index: index + 2, current: res2)
    }
}

func calculate(_ a: Int, _ op: Character, _ b: Int) -> Int {
    switch op {
    case "+": return a + b
    case "-": return a - b
    case "*": return a * b
    default: return 0
    }
}

if N == 1 {
    print(nums[0])
} else {
    dfs(index: 0, current: nums[0])
    print(dist.max()!)
}