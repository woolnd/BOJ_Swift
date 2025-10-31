//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

while true {
    let input = readLine()!

    if input == "." {
        exit(0)
    }

    var checkList: [Character] = []
    var ok: Bool = true
    
    for str in input {
        if str == "(" || str == "[" {
            checkList.append(str)
        } else if str == ")"{
            if checkList.last == "(" {
                checkList.removeLast()
            } else {
                ok = false
            }
        } else if str == "]"{
            if checkList.last == "["  {
                checkList.removeLast()
            } else {
                ok = false
            }
        }
        
        if !ok { break }
    }

    if ok && checkList.isEmpty {
        print("yes")
    } else {
        print("no")
    }
}