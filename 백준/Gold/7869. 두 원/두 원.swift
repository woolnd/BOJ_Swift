//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Double($0)! }
let x1 = input[0], y1 = input[1], r1 = input[2], x2 = input[3], y2 = input[4], r2 = input[5]


let d = sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2))

var result: Double = 0

if d >= r1 + r2 {
    result = 0
} else if d <= abs(r1 - r2) {
    result = Double.pi * pow((min(r1, r2)), 2)
} else {
    let theta1 = 2 * acos((pow(r1, 2) + pow(d, 2) - pow(r2, 2)) / (2 * r1 * d))
    let theta2 = 2 * acos((pow(r2, 2) + pow(d, 2) - pow(r1, 2)) / (2 * r2 * d))
    
    let area1 = 0.5 * pow(r1, 2) * (theta1 - sin(theta1))
    let area2 = 0.5 * pow(r2, 2) * (theta2 - sin(theta2))
    
    result = area1 + area2
}


print(String(format: "%.3f", result))