//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var section = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    section[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

var houses: [(Int, Int)] = []
var chickens: [(Int, Int)] = []

for i in 0..<N {
    for j in 0..<N {
        if section[i][j] == 1 {
            houses.append((i+1, j+1))
        } else if section[i][j] == 2{
            chickens.append((i+1, j+1))
        }
    }
}

var temp: [(Int, Int)] = []
var result = Int.max

func backtrack(_ start: Int) {
    if temp.count == M {
        let citySum = calculateChickenDistance(temp)
        result = min(result, citySum)
        
        return
    }
    
    for i in start..<chickens.count {
        temp.append(chickens[i])
        backtrack(i + 1)
        temp.removeLast()
    }
}

func calculateChickenDistance(_ selectedChickens: [(Int, Int)]) -> Int {
    var total = 0
    
    for house in houses {
        var minDist = Int.max
        
        for chicken in selectedChickens {
            let dist = abs(house.0 - chicken.0) + abs(house.1 - chicken.1)
            
            minDist = min(minDist, dist)
        }
        
        total += minDist
    }
    
    return total
}

backtrack(0)

print(result)