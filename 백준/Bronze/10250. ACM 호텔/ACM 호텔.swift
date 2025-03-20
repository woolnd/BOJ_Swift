//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

for _ in 0..<inputCase{
    if let input = readLine()?.split(separator: " "), input.count == 3{
        let H = Int(input[0]) ?? 0
        let W = Int(input[1]) ?? 0
        let N = Int(input[2]) ?? 0
        
        var count = 0
        
        for i in 0..<W {
            for j in 0..<H {
                count += 1

                if count == N {
                    if i >= 9 {
                        print("\(j+1)\(i+1)")
                    } else {
                        print("\(j+1)0\(i+1)")
                    }
                }
            }
        }
    }
}