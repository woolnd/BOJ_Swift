//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })

var N = input[0]
var d = input[1]
var k = input[2]
var c = input[3]

var array: [Int] = []

for _ in 0..<N {
    let inputSushi = Int(readLine()!)!
    array.append(inputSushi)
}

var start = 0
var end = 0
var totalCount = 0
var total: [Int] = []


var kindDict: [Int: Int] = [:]
var kindCount = 0

while start < N {
    if total.count < k {
        let sushi = array[end % N]
        total.append(sushi)
        
        kindDict[sushi, default: 0] += 1
        if kindDict[sushi] == 1 {
            kindCount += 1
        }
        end += 1
    } else {
        var tempCount = kindCount
        if kindDict[c] == nil || kindDict[c] == 0 {
            tempCount += 1
        }
        totalCount = max(totalCount, tempCount)
        
        let removeSushi = total.removeFirst()
        kindDict[removeSushi]! -= 1
        if kindDict[removeSushi]! == 0 {
            kindCount -= 1
        }
        start += 1
    }
}

print(totalCount)
