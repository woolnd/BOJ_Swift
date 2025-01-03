//
//  11399.swift
//  BOJ
//
//  Created by wodnd on 1/4/25.
//

import Foundation
let inputPeople = Int(readLine() ?? "0") ?? 0

if let inputTime = readLine()?.split(separator: " "), inputTime.count == inputPeople {
    var convertToInt = inputTime.map{ Int($0) ?? 0}
    
    convertToInt.sort { num1, num2 in
        return num1 < num2
    }
    var result = convertToInt[0]

    for i in 1..<convertToInt.count{
        for j in 0...i{
            result += convertToInt[j]
        }
    }
    
    print(result)
}