//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

func D(_ n: Int) -> Int { return (2*n) % 10000 }
func S(_ n: Int) -> Int { return n == 0 ? 9999 : n-1 }
func L(_ n: Int) -> Int { return (n%1000) * 10 + n/1000 }
func R(_ n: Int) -> Int { return (n/10) + (n%10)*1000 }


let T = Int(readLine()!)!

for _ in 0..<T {
    let inputAB = readLine()!.split(separator: " ").map{ Int($0)! }
    let A = inputAB[0], B = inputAB[1]
    
    bfs(A, B)
}

func bfs(_ a: Int, _ b: Int) {
    var queue: [(Int, String)] = [(a, "")]
    var visited = Array(repeating: false, count: 10000)
    
    visited[a] = true
    var idx = 0
    
    while idx < queue.count {
        let (value, command) = queue[idx]
        idx += 1
        
        if value == b {
            print(command)
            break
        }
        
        let d = D(value)
        if !visited[d] {
            visited[d] = true
            queue.append((d, command + "D"))
        }
        
        let s = S(value)
        if !visited[s] {
            visited[s] = true
            queue.append((s, command + "S"))
        }
        
        let l = L(value)
        if !visited[l] {
            visited[l] = true
            queue.append((l, command + "L"))
        }
        
        let r = R(value)
        if !visited[r] {
            visited[r] = true
            queue.append((r, command + "R"))
        }
    }
}