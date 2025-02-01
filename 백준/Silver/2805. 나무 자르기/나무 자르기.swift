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
    
    if let inputTree = readLine()?.split(separator: " "), inputTree.count == N {
        let trees = inputTree.compactMap { Int($0) }
    
        var start = 1
        var end = trees.max() ?? 0
        var result = 0  // 최적 해를 저장할 변수
        
        while start <= end {
            let mid = (start + end) / 2
            var length = 0
            
            for tree in trees {
                if tree > mid {
                    length += tree - mid
                }
            }
            
            if length >= M {
                result = mid
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        print(result)
    }
}