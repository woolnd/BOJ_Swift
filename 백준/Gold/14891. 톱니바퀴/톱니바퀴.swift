//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var cogwheel: [[Int]] = Array(repeating: [], count: 4)

for i in 0..<4 {
    let inputCogwheel = readLine()!
    let intInput = Array(inputCogwheel.map{ Int(String($0))! })
    
    cogwheel[i] = intInput
}


let inputCase = Int(readLine() ?? "0") ?? 0
var cmd: [[Int]] = Array(repeating: [], count: inputCase)

for i in 0..<inputCase {
    let inputCmd = readLine()!.split(separator: " ")
    let intCmd = Array(inputCmd.map{ Int($0)! })
    
    cmd[i] = intCmd
}

var cogwheelStart = [0, 0, 0, 0]
let score = [1, 2, 4, 8]
var rotateDir = [0, 0, 0, 0]

for i in 0..<inputCase {
    let choiceCogwheel = cmd[i][0] - 1
    let direction = cmd[i][1]
    
    // 매 명령마다 회전 방향 초기화
    var rotateDir = [0, 0, 0, 0]
    rotateDir[choiceCogwheel] = direction
    
    for i in choiceCogwheel..<3 {
        if (0 <= i && i + 1 < 4) {
            let left = cogwheel[i][(2 + cogwheelStart[i] + 8) % 8]
            let right = cogwheel[i+1][(6 + cogwheelStart[i+1] + 8) % 8]
            if  left != right  {
                rotateDir[i+1] = -rotateDir[i]
            } else {
                break
            }
        }
    }
    
    for i in stride(from: choiceCogwheel, to: 0, by: -1){
        if (i - 1 >= 0){
            let left = cogwheel[i][(6 + cogwheelStart[i] + 8) % 8]
            let right = cogwheel[i-1][(2 + cogwheelStart[i-1] + 8) % 8]
            if  left != right {
                rotateDir[i-1] = -rotateDir[i]
            } else {
                break
            }
        }
    }
    
    for j in 0..<4 {
        cogwheelStart[j] = (cogwheelStart[j] - rotateDir[j] + 8) % 8
    }
}

var resultSum = 0



for i in 0..<4 {
    if cogwheelStart[i] >= 0 {
        if cogwheel[i][cogwheelStart[i]] == 1{
            resultSum += score[i]
        }
    } else {
        if cogwheel[i][cogwheelStart[i] + 8] == 1{
            resultSum += score[i]
        }
    }
}


print(resultSum)