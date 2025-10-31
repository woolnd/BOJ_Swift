//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var list: [Int] = []
var checkList: [Int] = Array(1...N)
var stack: [Int] = []
var result: [Int] = []
var resultPopPush: [String] = []

for _ in 0..<N {
    let input = Int(readLine()!)!
    list.append(input)
}

var current = 0

while !list.isEmpty {
    if stack.isEmpty {
        if current == N {
            print("NO")
            exit(0)
        }
        stack.append(checkList[current])
        resultPopPush.append("+")
        current += 1
    } else {
        if stack.last == list.first {
            result.append(stack.last!)
            resultPopPush.append("-")
            stack.removeLast()
            list.removeFirst()
        } else {
            if current == N {
                print("NO")
                exit(0)
            }
            stack.append(checkList[current])
            resultPopPush.append("+")
            current += 1
        }
    }
}

for str in resultPopPush {
    print(str)
}