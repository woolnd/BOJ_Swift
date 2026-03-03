//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct PriorityQueue {
    // (cost, r, c, dir) 순서
    private var heap: [(Int, Int, Int, Int)] = []

    var isEmpty: Bool { heap.isEmpty }

    mutating func push(_ item: (Int, Int, Int, Int)) {
        heap.append(item)
        siftUp(from: heap.count - 1)
    }

    mutating func pop() -> (Int, Int, Int, Int) {
        if heap.count == 1 { return heap.removeLast() }
        let value = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        return value
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        while child > 0 {
            let parent = (child - 1) / 2
            // 비용(.0) 기준 최소 힙
            if heap[child].0 < heap[parent].0 {
                heap.swapAt(child, parent)
                child = parent
            } else { break }
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent
            if left < heap.count && heap[left].0 < heap[candidate].0 { candidate = left }
            if right < heap.count && heap[right].0 < heap[candidate].0 { candidate = right }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}


func dijkstra(start: (y: Int, x: Int), end: (y: Int, x: Int), maps: [[String]]) -> Int {
    var dist = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: W), count: H)
    var pq = PriorityQueue()
    
    for i in 0..<4 {
        dist[start.y][start.x][i] = 0
        pq.push((0, start.y, start.x, i))
    }
    
    while !pq.isEmpty {
        let (cost, y, x, dir) = pq.pop()
        
        if dist[y][x][dir] < cost { continue }
        
        if y == end.y && x == end.x { return cost }
        
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            if ny < 0 || ny >= H || nx < 0 || nx >= W { continue }
            if maps[ny][nx] == "*" { continue }
            
            let nextCost = (dir == i) ? cost : cost + 1
            
            if dist[ny][nx][i] > nextCost {
                dist[ny][nx][i] = nextCost
                pq.push((nextCost, ny, nx, i))
            }
        }
    }
    
    return 0
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let W = input[0], H = input[1]
var maps = Array(repeating: [String](), count: H)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

for i in 0..<H {
    let input = readLine()!.map { String($0) }
    maps[i] = input
}


var positions: [(y: Int, x: Int)] = []

for i in 0..<H {
    for j in 0..<W {
        if maps[i][j] == "C" {
            positions.append((i, j))
        }
    }
}

let start = positions[0]
let end = positions[1]

let result = dijkstra(start: start, end: end, maps: maps)
print(result)
