//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var array: [Int] = []
    
    for _ in 0..<inputNumber {
        if let inputCommand = readLine()?.split(separator: " ") {
            let command = String(inputCommand[0])
            let data = inputCommand.count > 1 ? Int(inputCommand[1]) ?? 0 : nil
            
            switch command {
            case "push":
                if let data = data {
                    push(data: data, array: &array)
                }
            case "pop":
                pop(array: &array)
            case "size":
                size(array: &array)
            case "empty":
                empty(array: &array)
            case "top":
                top(array: &array)
            default:
                continue
            }
        }
    }
}

func push(data: Int, array: inout [Int]) {
    array.append(data)
}

func pop(array: inout [Int]) {
    if array.isEmpty {
        print("-1")
    } else {
        print(array.removeLast())
    }
}

func size(array: inout [Int]) {
    print(array.count)
}

func empty(array: inout [Int]) {
    print(array.isEmpty ? "1" : "0")
}

func top(array: inout [Int]) {
    if array.isEmpty {
        print("-1")
    } else {
        print(array.last ?? -1)
    }
}
