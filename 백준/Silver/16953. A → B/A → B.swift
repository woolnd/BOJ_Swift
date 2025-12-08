//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputAB = readLine()!.split(separator: " ").map{ Int($0)! }

let A = inputAB[0], B = inputAB[1]


func bfs(start: Int) {
    var queue: [(Int, Int)] = []
    
    queue.append((start, 1))
    var idx = 0
    
    while idx < queue.count {
        let (now, cnt) = queue[idx]
        idx += 1
        
        if now == B {
            print(cnt)
            return
        }
        
        let n1 = now * 2
        let n2 = now * 10 + 1
        
        if n1 <= B { queue.append((n1, cnt + 1)) }
        if n2 <= B { queue.append((n2, cnt + 1)) }
    }
    
    print(-1)
}


bfs(start: A)