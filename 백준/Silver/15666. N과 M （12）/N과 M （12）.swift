//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var list = readLine()!.split(separator: " ").map{ Int($0)! }
list.sort(by: <)

var temp: [Int] = []
var result: [[Int]] = []

func backtrack() {
    if temp.count == M {
        if !result.contains(temp) {
            result.append(temp)
        }

        return
    }

    var last = 0

    for num in list {
        if num == last { continue }
        if let last = temp.last, last > num { continue }

        last = num

        temp.append(num)
        backtrack()
        temp.removeLast()
    }
}

backtrack()

for num in result {
    print(num.map{ String($0) }.joined(separator: " "))
}