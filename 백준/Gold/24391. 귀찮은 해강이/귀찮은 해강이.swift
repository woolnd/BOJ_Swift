//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var building = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    
    building[a].append(b)
    building[b].append(a)
}

let lecture = readLine()!.split(separator: " ").map{ Int($0)! }

var comp = Array(repeating: 0, count: N + 1)
var compID = 0

for start in 1...N {
    if comp[start] != 0 { continue }
    compID += 1

    var q = [Int]()
    var head = 0
    q.append(start)
    comp[start] = compID

    while head < q.count {
        let v = q[head]
        head += 1
        for next in building[v] {
            if comp[next] == 0 {
                comp[next] = compID
                q.append(next)
            }
        }
    }
}

var ans = 0
for i in 1..<N {
    if comp[lecture[i-1]] != comp[lecture[i]] { ans += 1 }
}
print(ans)