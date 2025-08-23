//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
let targets = readLine()!.split(separator: " ").map { Int($0)! }

var alive = Array(repeating: true, count: N + 1)
var head = 1
var size = N
var answer = 0


func nextAlive(_ start: Int) -> Int {
    var i = start
    while true {
        var j = i
        if j > N { j = 1 }
        if alive[j] { return j }
        i = j + 1
    }
}

for t in targets {
    
    var steps = 0
    var i = head
    while i != t {
        i = nextAlive(i + 1)
        steps += 1
    }
    let left = steps
    let right = size - steps
    answer += min(left, right)

    
    alive[t] = false
    size -= 1
    if size == 0 { break }
    head = nextAlive(t + 1)
}

print(answer)