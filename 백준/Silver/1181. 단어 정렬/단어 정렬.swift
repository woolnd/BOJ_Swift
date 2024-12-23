//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCount = Int(readLine() ?? "0") ?? 0

var array: Set<String> = []

for _ in 0..<inputCount{
    let input = readLine() ?? "0"
    array.insert(input)
}

let result = array.sorted {
    if $0.count == $1.count {
        return $0 < $1 // 길이가 같으면 사전 순으로 정렬
    }
    return $0.count < $1.count // 길이에 따라 정렬
}

for string in result {
    print(string)
}