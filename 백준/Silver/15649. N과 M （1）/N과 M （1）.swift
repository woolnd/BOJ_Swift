//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2{
    let N = Int(input[0]) ?? 0
    let M = Int(input[1]) ?? 0
    
    var visited = Array(repeating: false, count: N + 1)
    var array: [Int] = []
    
    func Soluction(index: Int) {
        if index == M {
            print(array.map{ String($0) }.joined(separator: " "))
            return
        } else {
            for i in 1...N {
                if !visited[i] {
                    visited[i] = true
                    array.append(i)
                    Soluction(index: index + 1)
                    visited[i] = false
                    array.removeLast()
                }
            }
        }
    }
    
    Soluction(index: 0)
}