//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "0") ?? 0
var numbers = readLine()!.split(separator: " ").map{ Int(String($0))! }
var maxValue = 0


func perm(_ arr: inout [Int], _ curr: Int) {
    var sum = 0
    
    if curr == input {
        for i in 0 ..< input - 1{
            sum += abs(arr[i] - arr[i + 1])
        }
        
        if sum > maxValue {
            maxValue = sum
        }
    }
    
    for i in curr ..< input{
        arr.swapAt(curr, i)
        perm(&arr, curr + 1)
        arr.swapAt(curr, i)
    }
}

perm(&numbers, 0)
print(maxValue)