//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let a = readLine()!
let b = readLine()!
let c = readLine()!

func render(_ n: Int) -> String {
    if n % 15 == 0 { return "FizzBuzz" }
    if n % 3 == 0  { return "Fizz" }
    if n % 5 == 0  { return "Buzz" }
    return String(n)
}

var T: Int = 0
if let v = Int(c) {
    T = v + 1
} else if let v = Int(b) {
    T = v + 2
} else if let v = Int(a) {
    T = v + 3
}

print(render(T))