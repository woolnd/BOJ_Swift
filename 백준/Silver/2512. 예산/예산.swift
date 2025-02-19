//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

if let input = readLine()?.split(separator: " "), input.count == inputCase {
    let cities = input.compactMap{ Int($0) }
    
    let inputTotal = Int(readLine() ?? "0") ?? 0
    
    var start = 1
    var end = cities.max()!
    var result = 0
    
    while start <= end {
        var mid = (start + end) / 2
        var money = 0
        
        for city in cities{
            if mid < city{
                money += mid
            } else {
                money += city
            }
        }
        
        if money <= inputTotal{
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    
    print(result)
}