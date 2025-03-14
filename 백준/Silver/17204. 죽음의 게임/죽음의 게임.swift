//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let N = Int(input[0]) ?? 0
    let K = Int(input[1]) ?? 0
    
    var choiceArray: [Int] = Array(repeating: 0, count: N)
    
    for i in 0..<N {
        let intInput = Int(readLine() ?? "0") ?? 0
        choiceArray[i] = intInput
    }
    
    var visited: [Bool] = Array(repeating: false, count: N)
    
    func solution(_ A: inout [Int], _ K: Int) -> Int {
        var index = 0
        var count = 0
        
        while index != K {
            if !visited[index] {
                visited[index] = true
                let choice = A[index]
                count += 1
                index = choice
            } else {
                return -1
            }
        }
        
        return count
    }
    
    print(solution(&choiceArray, K))
}