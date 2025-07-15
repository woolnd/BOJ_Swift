//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let value: [String : String] = [
    "black" : "0",
    "brown" : "1",
    "red" : "2",
    "orange" : "3",
    "yellow" : "4",
    "green" : "5",
    "blue" : "6",
    "violet" : "7",
    "grey" : "8",
    "white" : "9"
]

let product: [String : Int] = [
    "black" : 1,
    "brown" : 10,
    "red" : 100,
    "orange" : 1000,
    "yellow" : 10000,
    "green" : 100000,
    "blue" : 1000000,
    "violet" : 10000000,
    "grey" : 100000000,
    "white" : 1000000000
]

var resultValue: String = ""
var result: Int = 0

for i in 0..<3 {
    let input = readLine()!
    if i == 2{
        result = Int(resultValue)! * product[input]!
    } else {
        resultValue += value[input]!
    }
}

print(result)