//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "") ?? 0

for _ in 0..<inputCase {
    let inputCmd = Array(readLine().map{ String($0) } ?? "")
    let inputCount = Int(readLine() ?? "") ?? 0
    var array = Array(readLine()!.dropFirst().dropLast().split(separator: ","))
    
    var head = 0
    var tail = array.count
    var toggle = false
    
    for cmd in inputCmd {
        if cmd == "R"{
            toggle.toggle()
        } else if cmd == "D"{
            if !toggle {
                head += 1
            } else {
                tail -= 1
            }
        }
    }
    
    if head > tail {
        print("error")
    } else {
        if toggle {
            print("[\(array[head..<tail].reversed().joined(separator: ","))]")
        } else {
            print("[\(array[head..<tail].joined(separator: ","))]")
        }
    }
    
}
