//
//  main.swift
//  BOJ
//
//
import Foundation

let N = Int(readLine()!)!
let tSize = readLine()!.split(separator: " ").map{ Int($0)! }

let inputTP = readLine()!.split(separator: " ").map{ Int($0)! }
let T = inputTP[0], P = inputTP[1]

var resultT = 0

for t in tSize {
    if t == 0{
        continue
    }
    
    if T > t {
        resultT += 1
    } else if t % T == 0 {
        resultT += t / T
    } else {
        resultT += (t / T + 1)
    }
}

print(resultT)
print("\(N / P) \(N % P)")