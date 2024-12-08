//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine() {
    let testCases = Int(input) ?? 0
    
    for _ in 0..<testCases {
        // 명령 입력
        let commands = readLine()?.compactMap { String($0) } ?? []
        
        // 숫자 개수 입력
        let count = Int(readLine() ?? "0") ?? 0
        
        // 배열 입력
        var array = readLine()!.dropFirst().dropLast().split(separator: ",").map{String($0)}
        
        var head = 0
        var check = false
        var tail = array.count
        
        for command in commands {
            switch command {
            case "R":
                check.toggle()
            case "D":
                if check {
                    tail -= 1
                }
                else {
                    head += 1
                }
            default:
                break
            }
        }
        
        if head > tail {
            print("error")
        }
        
        else {
            if check {
                print("[\(array[head..<tail].reversed().joined(separator: ","))]")
            } else {
                print("[\(array[head..<tail].joined(separator: ","))]")
            }
        }
    }
}