//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var numToName = [Int: String]()
var nameToNum = [String: Int]()

for i in 0..<N {
    let input = readLine()!
    
    numToName[i + 1] = input
    nameToNum[input] = i + 1
}

for _ in 0..<M {
    let input = readLine()!
    
    if let num = Int(input) {
        print(numToName[num]!)
    } else {
        print(nameToNum[input]!)
    }
}