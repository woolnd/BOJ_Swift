//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let N = Int(input[0]) ?? 0
    let C = Int(input[1]) ?? 0
    
    var houses: [Int] = []
    
    for _ in 0..<N {
        houses.append(Int(readLine() ?? "0") ?? 0)
    }
    
    houses.sort(by: <)
    
    var start = 1
    var end = houses[N - 1]  - houses[0]
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var current = houses[0]
        var count = 1
        
        for house in houses {
            if house >= current + mid {
                count += 1
                current = house
            }
        }
        
        if count >= C {
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    
    print(result)
}