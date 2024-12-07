//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//

import Foundation

if let input = readLine(){
    let inputNumber = Int(input) ?? 0
    if var command = readLine()?.split(separator: " "){
        
        var front: [Int] = []
        var back: [Int] = []
        
        for index in 0..<inputNumber {
            switch command.removeLast() {
            case "1":
                front.append(index + 1)
            case "2":
                if !front.isEmpty {
                    let temp = front.removeLast()
                    front.append(index + 1)
                    front.append(temp)
                } else {
                    front.append(index + 1)
                }
            case "3":
                back.append(index + 1)
            default:
                break
            }
        }
        print((front.reversed() + back).compactMap{ String($0) }.joined(separator: " "))
    }
}