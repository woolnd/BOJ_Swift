//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 2{
    let N = Int(inputCase[0]) ?? 0
    let M = Int(inputCase[1]) ?? 0
    
    var array: [[Int]] = Array(repeating: [], count: N)
    
    for i in 0..<N {
        let value = Array(readLine()!.map{ String($0) }).map{ Int($0)! }
        array[i] = value
    }
    
    var maxSize = min(N, M)
    var result = 1
    
    for i in 0..<N{
        for j in 0..<M {
            for size in 1..<maxSize {
                if i + size < N && j + size < M {
                    let temp = array[i][j]
                    
                    if array[i + size][j] == temp && array[i][j + size] == temp && array[i + size][j + size] == temp {
                        result = max((size + 1) * (size + 1), result)
                    }
                }
            }
        }
    }
    
    print(result)
}