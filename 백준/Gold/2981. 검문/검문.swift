//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "0") ?? 0

var array: [Int] = []

for _ in 0..<input {
    array.append(Int(readLine() ?? "0") ?? 0)
}

// 각각의 차이를 계산하고 최대공약수를 구한다
let differences = array.map { $0 - array[0] }
let gcd = differences.reduce(0) { GCD($0, abs($1)) }

if gcd <= 1 {
    print("")
    exit(0)
} else {
    var result: Set<Int> = []
    for i in 1...Int(sqrt(Double(gcd))) {
        if gcd % i == 0 {
            result.insert(i)
            result.insert(gcd / i)
        }
    }
    
    // 결과를 정렬 후 출력
    print(result.sorted().filter { $0 > 1 }.map { String($0) }.joined(separator: " "))
}

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    return GCD(b, a % b)
}