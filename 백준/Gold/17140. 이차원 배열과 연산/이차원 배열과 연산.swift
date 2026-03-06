//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let r = input[0], c = input[1], k = input[2]

var A = Array(repeating: [Int](), count: 3)

for i in 0..<3 {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    A[i] = input
}

var time = 0

while time <= 100 {
    
    let currentR = A.count
    let currentC = A[0].count
    
    
    if r-1 < currentR && c-1 < currentC {
        if A[r-1][c-1] == k {
            print(time)
            exit(0)
        }
    }
    
    if time == 100 {
        break
    }
    
    let R = A.count
    let C = A[0].count
    
    if R >= C {
        A = performR(A)
    } else {
        A = performC(A)
    }
    
    time += 1
}

print(-1)

func performR(_ A: [[Int]]) -> [[Int]]{
    var nextMatrix = [[Int]]()
    var maxLen = 0
    
    for row in A {
        var dict = [Int: Int]()
        row.forEach { if $0 != 0 { dict[$0, default: 0] += 1 } }
        
        let sorted = dict.sorted { a, b in
            if a.value == b.value {
                return a.key < b.key
            } else {
                return a.value < b.value
            }
        }
        
        var newRow = [Int]()
        for (num, count) in sorted {
            newRow.append(num)
            newRow.append(count)
            if newRow.count >= 100 { break }
        }
        maxLen = max(maxLen, newRow.count)
        nextMatrix.append(newRow)
    }
    
    for i in 0..<nextMatrix.count {
        while nextMatrix[i].count < maxLen {
            nextMatrix[i].append(0)
        }
    }
    
    return nextMatrix
}

func performC(_ A: [[Int]]) -> [[Int]] {
    let rowCount = A.count
    let colCount = A[0].count
    
    var tempResults = [[Int]]()
    var maxLen = 0
    
    for col in 0..<colCount {
        var dict = [Int: Int]()
        for row in 0..<rowCount {
            let val = A[row][col]
            if val != 0 { dict[val, default: 0] += 1 }
        }
        
        let sorted = dict.sorted {
            $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value
        }
        
        var newCol = [Int]()
        for (num, count) in sorted {
            newCol.append(num)
            newCol.append(count)
            if newCol.count >= 100 { break }
        }
        
        tempResults.append(newCol)
        maxLen = max(maxLen, newCol.count)
    }
    
    var nextMatrix = Array(repeating: Array(repeating: 0, count: colCount), count: maxLen)
    
    for (c, colData) in tempResults.enumerated() {
        for (r, value) in colData.enumerated() {
            nextMatrix[r][c] = value
        }
    }
    
    return nextMatrix
}
