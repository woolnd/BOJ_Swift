//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

while true {
    if let input = readLine()?.split(separator: " "){
        
        if input[0] == "0" {
            exit(0)
        }
        
        var numbers = input.compactMap{ Int($0) }
        numbers.removeFirst()
        
        
        
        func Combination(arr: inout [Int], start: Int){
            if arr.count == 6 {
                var stringArr = arr.compactMap{ String($0) }.joined(separator: " ")
                print(stringArr)
                return
            }
            
            for i in start ..< numbers.count {
                arr.append(numbers[i])
                Combination(arr: &arr, start: i + 1)
                arr.removeLast()
            }
        }
        
        var arr: [Int] = []
        
        Combination(arr: &arr, start: 0)
    }
    
    print("")
}