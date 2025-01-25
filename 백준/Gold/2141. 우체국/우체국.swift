//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let officeInput = Int(readLine() ?? "0") ?? 0
var villages: [(position: Int, people: Int)] = []

for _ in 0..<officeInput {
    if let input = readLine()?.split(separator: " "), input.count == 2 {
        let x = Int(input[0]) ?? 0
        let a = Int(input[1]) ?? 0
        villages.append((position: x, people: a))
    }
}


// 마을을 위치(x) 기준으로 정렬
villages.sort { $0.position < $1.position }
var totalPeople = 0

for village in villages{
    totalPeople += village.people
}


var halfPeople = (totalPeople + 1) / 2
var moreHalf = 0
for village in villages {
    moreHalf += village.people
    
    if moreHalf >= halfPeople{
        print(village.position)
        break
    }
}