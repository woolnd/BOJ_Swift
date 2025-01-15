//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

var students: [(String, Int, Int, Int)] = []

for _ in 0..<inputCase {
    if let info = readLine()?.split(separator: " "){
        let name = String(info[0])
        let korean = Int(info[1]) ?? 0
        let english = Int(info[2]) ?? 0
        let math = Int(info[3]) ?? 0
        
        students.append((name, korean, english, math))
    }
}

students.sort {
    if $0.1 != $1.1 {
        return $0.1 > $1.1
    } else if $0.2 != $1.2 {
        return $0.2 < $1.2
    } else if $0.3 != $1.3 {
        return $0.3 > $1.3
    } else {
        return $0.0 < $1.0
    }
}

for student in students {
    print(student.0)
}