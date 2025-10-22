//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let ascending = Array(1...8)
let descending = Array(1...8).sorted(by: >)

if input == ascending {
    print("ascending")
} else if input == descending {
    print("descending")
} else {
    print("mixed")
}