//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

func circumcircle(x1: Double, y1: Double, x2: Double, y2: Double, x3: Double, y3: Double) -> Double {
    let D = 2 * (x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2))
    
    let x1sq = x1*x1 + y1*y1
    let x2sq = x2*x2 + y2*y2
    let x3sq = x3*x3 + y3*y3
    
    let xo = (x1sq*(y2 - y3) + x2sq*(y3 - y1) + x3sq*(y1 - y2)) / D
    let yo = (x1sq*(x3 - x2) + x2sq*(x1 - x3) + x3sq*(x2 - x1)) / D
    
    let circumference = sqrt(pow(x1 - xo, 2) + pow(y1 - yo, 2))
    
    return circumference
}

let Pi = 3.141592653589793

while let line = readLine() {
    let input = line.split(separator: " ").map{ Double($0)! }
    
    let x1 = input[0], y1 = input[1], x2 = input[2], y2 = input[3], x3 = input[4], y3 = input[5]
    
    let result = circumcircle(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3)
    
    print(String(format: "%.2f", 2 * Pi * result))
}