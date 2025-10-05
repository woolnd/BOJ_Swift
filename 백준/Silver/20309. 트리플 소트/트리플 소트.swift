//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{ Int($0)! }
let check = list.sorted()

func tripleReverse(_ arr: inout [Int], center i: Int) {
    arr.swapAt(i - 1, i + 1)
}

var changed = true

while changed {
    changed = false
    for i in 1..<(N - 1) {
        if list[i - 1] > list[i + 1] {
            tripleReverse(&list, center: i)
            changed = true
        }
    }
}


print(list == check ? "YES" : "NO")