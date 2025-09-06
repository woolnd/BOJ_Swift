//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list = Array(repeating: Array(repeating: "", count: N), count: N)
var result: [Int] = []

for i in 0..<N {
    let input = Array(readLine()!.map{ String($0) })
    
    list[i] = input
}

for i in 0..<N {
    var friend = Set<Int>()
    
    for j in 0..<N {
        if list[i][j] == "Y" {
            friend.insert(j)
            
            for  k in 0..<N {
                if list[j][k] == "Y" {
                    friend.insert(k)
                }
            }
        }
    }
    
    result.append(friend.count == 0 ? 0 : friend.count - 1)
}

print(result.max()!)