//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputA = readLine()!
let inputB = readLine()!

func romanToInt(_ input: String) -> Int {
    let romanMap: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    let chars = Array(input)
    var total = 0
    
    for i in 0..<chars.count {
        let current = romanMap[chars[i]]!
        let next = i + 1 < chars.count ? romanMap[chars[i+1]]! : 0
        
        if current < next {
            total -= current
        } else {
            total += current
        }
    }
    
    return total
}

func intToRoman(_ input: Int) -> String {
    let valueMap: [(Int, String)] = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
                                     (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
                                     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
    
    var num = input
    var result = ""
    
    for (value, symbol) in valueMap {
        while num >= value {
            num -= value
            result += symbol
        }
    }
    
    return result
}

func isValidRoman(_ s: String) -> Bool {
    let invalidPatterns = ["IIII", "XXXX", "CCCC", "MMMM", "VV", "LL", "DD"]
    for pattern in invalidPatterns {
        if s.contains(pattern) {
            return false
        }
    }
    return true
}

if isValidRoman(inputA) && isValidRoman(inputB){
    let intA = romanToInt(inputA)
    let intB = romanToInt(inputB)
    
    let resultInt = intA + intB
    let resultString = intToRoman(resultInt)
    
    print(resultInt)
    print(resultString)
}