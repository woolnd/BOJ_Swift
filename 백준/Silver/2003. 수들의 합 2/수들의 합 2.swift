//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!

let array: [Int]

let inputArray = readLine()!.split(separator: " ")
let inputInt = Array(inputArray.map{ Int(String($0))! })
array = inputInt

var sum = 0
var count = 0
var start = 0
var end = 0

while true {

    if sum >= M{
        sum -= array[start]
        start += 1
    } else if end == N{
        break
    } else {
        sum += array[end]
        end += 1
    }

    if sum == M {
        count += 1
    }
}

print(count)