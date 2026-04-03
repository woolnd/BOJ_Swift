//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var players: [(white: Int, black: Int)] = []

while let line = readLine() {
    let scores = line.split(separator: " ").compactMap { Int($0) }
    if scores.count == 2 {
        let white = scores[0]
        let black = scores[1]
        
        players.append((white, black))
    }
}

var dp = Array(repeating: Array(repeating: 0, count: 16), count: 16)

for player in players {
    
    for w in stride(from: 15, through: 0, by: -1) {
        for b in stride(from: 15, through: 0, by: -1) {
            if w > 0 {
                dp[w][b] = max(dp[w][b], dp[w-1][b] + player.white)
            }
            
            if b > 0 {
                dp[w][b] = max(dp[w][b], dp[w][b-1] + player.black)
            }
        }
    }
}

print(dp[15][15])