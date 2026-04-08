//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var results: [String] = []

for _ in 0..<4 {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    var scores = [[Int]]()
    
    for i in stride(from: 0, to: 18, by: 3) {
        scores.append([input[i], input[i+1], input[i+2]])
    }
    
    var matches = [(Int, Int)]()
    
    for i in 0..<5 {
        for j in (i + 1)..<6 {
            matches.append((i, j))
        }
    }
    
    func backtrack(matchIndex: Int) -> Bool {
        if matchIndex == 15 {
            for team in scores {
                if team[0] != 0 || team[1] != 0 || team[2] != 0 {
                    return false
                }
            }
            return true
        }
        
        let team1 = matches[matchIndex].0
        let team2 = matches[matchIndex].1
        
        if scores[team1][0] > 0 && scores[team2][2] > 0 {
            scores[team1][0] -= 1
            scores[team2][2] -= 1
            
            if backtrack(matchIndex: matchIndex + 1) { return true }
            
            scores[team1][0] += 1
            scores[team2][2] += 1
        }
        
        if scores[team1][1] > 0 && scores[team2][1] > 0 {
            scores[team1][1] -= 1
            scores[team2][1] -= 1
            
            if backtrack(matchIndex: matchIndex + 1) { return true }
            
            scores[team1][1] += 1
            scores[team2][1] += 1
        }
        
        if scores[team1][2] > 0 && scores[team2][0] > 0 {
            scores[team1][2] -= 1
            scores[team2][0] -= 1
            
            if backtrack(matchIndex: matchIndex + 1) { return true }
            
            scores[team1][2] += 1
            scores[team2][0] += 1
        }
        return false
    }
    
    let result = backtrack(matchIndex: 0)
    
    results.append(result ? "1" : "0")
}

print(results.joined(separator: " "))