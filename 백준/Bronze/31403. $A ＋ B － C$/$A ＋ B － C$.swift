//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let A = readLine()!
let B = readLine()!
let C = Int(readLine()!)!

let resultNum = Int(A)! + Int(B)! - C
let AB = A + B
let resultChar = Int(AB)! - C
print(resultNum)
print(resultChar)