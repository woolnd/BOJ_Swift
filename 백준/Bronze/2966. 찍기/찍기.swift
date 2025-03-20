//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "0") ?? 0
let inputAnswer = readLine() ?? ""
let arrayAnswer = Array(inputAnswer)

let AdrianAnswer = ["A", "B", "C"]
let BrunoAnswer = ["B", "A", "B", "C"]
let GoranAnswer = ["C", "C", "A", "A", "B", "B"]


var AdrianCount = 0
var BrunoCount = 0
var GoranCount = 0

for i in 0..<arrayAnswer.count {
    
    let chkAdrian = i % 3
    let chkBruno = i % 4
    let chkGoran = i % 6
    
    if String(AdrianAnswer[chkAdrian]) == String(arrayAnswer[i]) {
        AdrianCount += 1
    }
    
    if String(BrunoAnswer[chkBruno]) == String(arrayAnswer[i]) {
        BrunoCount += 1
    }
    
    if String(GoranAnswer[chkGoran]) == String(arrayAnswer[i]) {
        GoranCount += 1
    }
}

var result: [Int] = []
var name: [String] = ["Adrian", "Bruno", "Goran"]
result.append(AdrianCount)
result.append(BrunoCount)
result.append(GoranCount)

print(result.max() ?? 0)
for i in 0..<3{
    if result.max() == result[i]{
        print(name[i])
    }
}