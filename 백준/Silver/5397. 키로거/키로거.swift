////
////  main.swift
////  BOJ
////
////  Created by wodnd on 9/16/24.
////
import Foundation

if let input = readLine() {
    let inputCase = Int(input) ?? 0
    
    for _ in 0..<inputCase {
        if let inputCommand = readLine() {
            var left: [Character] = []
            var right: [Character] = []
            
            for command in inputCommand {
                if command == "<" {
                    // 왼쪽 스택에서 오른쪽 스택으로 이동
                    if !left.isEmpty {
                        right.append(left.removeLast())
                    }
                } else if command == ">"{
                    // 오른쪽 스택에서 왼쪽 스택으로 이동
                    if !right.isEmpty {
                        left.append(right.removeLast())
                    }
                } else if command == "-"{
                    // 왼쪽 스택에서 문자 삭제
                    if !left.isEmpty {
                        left.removeLast()
                    }
                } else {
                    // 왼쪽 스택에 문자 추가
                    left.append(command)
                }
            }
            
            print(String(left + right.reversed()))
        }
    }
}