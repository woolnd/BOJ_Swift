//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ")

let length = Int(input[0])!
let width = Int(input[1])!
let height = Int(input[2])!

var totalSize = length * width * height

let N = Int(readLine()!)!

var cubes = [Int](repeating: 0, count: 20)

for _ in 0..<N {
    let inputCube = readLine()!.split(separator: " ")
    let a = Int(inputCube[0])!
    let b = Int(inputCube[1])!
    cubes[a] = b
}

var filledVolume = 0
var answer = 0

for i in stride(from: 19, through: 0, by: -1) {
    let len = 1 << i // 2^i
    let volume = len * len * len

    let space = (length / len) * (width / len) * (height / len) //차지하는 공간
    let required = space - (filledVolume / volume) // 요구되는 큐브 갯수
    if required <= 0 { continue }

    let used = min(required, cubes[i])
    answer += used
    filledVolume += used * volume
}

if filledVolume == totalSize {
    print(answer)
} else {
    print(-1)
}