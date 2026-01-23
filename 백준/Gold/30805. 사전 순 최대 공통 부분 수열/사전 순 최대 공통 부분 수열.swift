//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{ Int($0)! }
let M = Int(readLine()!)!
let B = readLine()!.split(separator: " ").map{ Int($0)! }

var ans: [Int] = []
var curA = 0
var curB = 0

while true {
    var found = false
    
    for v in stride(from: 100, through: 1, by: -1) {
        var nextA = -1
        var nextB = -1
        
        // A에서 v의 위치 찾기
        for i in curA..<N {
            if A[i] == v {
                nextA = i
                break
            }
        }
        
        for j in curB..<M {
            if B[j] == v {
                nextB = j
                break
            }
        }
        
        if nextA != -1 && nextB != -1 {
            ans.append(v)
            curA = nextA + 1
            curB = nextB + 1
            found = true
            break
        }
    }
    
    if !found { break }
}


print(ans.count)
if !ans.isEmpty {
    print(ans.map { String($0) }.joined(separator: " "))
}
