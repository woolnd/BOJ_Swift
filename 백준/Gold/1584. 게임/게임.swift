//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct PriorityQueue {
    private var heap: [(Int, Int, Int)] = []
    var isEmpty: Bool { heap.isEmpty }
    
    mutating func push(_ item: (Int, Int, Int)) {
        heap.append(item); siftUp(from: heap.count - 1)
    }
    
    mutating func pop() -> (Int, Int, Int) {
        if heap.count == 1 { return heap.removeLast() }
        let value = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        return value
    }
    
    private mutating func siftUp(from index: Int) {
        var c = index
        var p = (c - 1) / 2
        while c > 0 && heap[c].0 < heap[p].0 {
            heap.swapAt(c, p); c = p; p = (c - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var p = index
        while true {
            let l = p * 2 + 1
            let r = l + 1
            var cand = p
            if l < heap.count && heap[l].0 < heap[cand].0 { cand = l }
            if r < heap.count && heap[r].0 < heap[cand].0 { cand = r }
            if cand == p { return }
            heap.swapAt(p, cand); p = cand
        }
    }
}

var section = Array(repeating: Array(repeating: 0, count: 501), count: 501)
let N = Int(readLine()!)!

for _ in 0..<N {
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = min(a[0], a[2])
    let x2 = max(a[0], a[2])
    let y1 = min(a[1], a[3])
    let y2 = max(a[1], a[3])
    
    for y in y1...y2 {
        for x in x1...x2 {
            section[y][x] = -1
        }
    }
}

let M = Int(readLine()!)!

for _ in 0..<M {
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = min(a[0], a[2])
    let x2 = max(a[0], a[2])
    let y1 = min(a[1], a[3])
    let y2 = max(a[1], a[3])
    
    for y in y1...y2 {
        for x in x1...x2 {
            section[y][x] = -2
        }
    }
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]


var pq = PriorityQueue()
pq.push((0, 0, 0))
var idx = 0

let INF = Int.max
var dist = Array(repeating: Array(repeating: INF, count: 501), count: 501)

while !pq.isEmpty {
    let (cost, y, x) = pq.pop()
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= 501 || nx < 0 || nx >= 501 { continue }
        if section[ny][nx] == -2 { continue }
        
        let w = (section[ny][nx] == -1) ? 1 : 0
        let nd = cost + w
        
        if nd < dist[ny][nx] {
            dist[ny][nx] = nd
            pq.push((nd, ny, nx))
        }
    }
}

if dist[500][500] == INF {
    print(-1)
} else {
    print(dist[500][500])
}