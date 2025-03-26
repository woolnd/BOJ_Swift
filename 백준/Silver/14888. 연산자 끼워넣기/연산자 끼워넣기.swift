//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "") ?? 0
let inputNumber = readLine()!.split(separator: " ").compactMap{ Int($0) }
var inputOper = readLine()!.split(separator: " ").compactMap{ Int($0) }

var maxValue = Int.min
var minValue = Int.max

func DFS(index: Int, current: Int) {
    if index == inputNumber.count {
        maxValue = max(maxValue, current)
        minValue = min(minValue, current)

        return
    } else {
        for i in 0..<4{
            if inputOper[i] > 0 {
                
                var result = 0
                
                switch i {
                case 0: result = current + inputNumber[index]
                case 1: result = current - inputNumber[index]
                case 2: result = current * inputNumber[index]
                default:
                    if current < 0 {
                        result = -(-current / inputNumber[index])
                    } else {
                        result = current / inputNumber[index]
                    }
                }
                
                inputOper[i] -= 1
                DFS(index: index + 1, current: result)
                inputOper[i] += 1
            }
        }
    }
}

DFS(index: 1, current: inputNumber[0])

print(maxValue)
print(minValue)