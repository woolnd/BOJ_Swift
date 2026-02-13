//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct PriorityQueue {
    private var heap: [(Int, Int)] = [] // (cost, node)

    var isEmpty: Bool { heap.isEmpty }

    mutating func push(_ item: (Int, Int)) {
        heap.append(item)
        siftUp(from: heap.count - 1)
    }

    mutating func pop() -> (Int, Int) {
        if heap.count == 1 { return heap.removeLast() }

        let value = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        return value
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && heap[child].0 < heap[parent].0 {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent

            if left < heap.count && heap[left].0 < heap[candidate].0 {
                candidate = left
            }
            if right < heap.count && heap[right].0 < heap[candidate].0 {
                candidate = right
            }
            if candidate == parent { return }

            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

let INF = Int.max

func dijstra(start: Int, graph: [[(Int, Int)]]) -> ([Int]) {
    var dist = Array(repeating: INF, count: graph.count)
    var parent = Array(repeating: 0, count: graph.count)
    
    dist[start] = 0
    
    var pq = PriorityQueue()
    pq.push((0, start))
    
    while !pq.isEmpty {
        let (cost, now) = pq.pop()
        if dist[now] < cost { continue }
        
        for (next, w) in graph[now] {
            let nextCost = w + cost
            if nextCost < dist[next] {
                dist[next] = nextCost
                parent[next] = now
                pq.push((nextCost, next))
            }
        }
    }
    
    return (parent)
}

let inputNM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNM[0], M = inputNM[1]

var computers = Array(repeating: [(Int, Int)](), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let A = input[0], B = input[1], C = input[2]
    
    computers[A].append((B, C))
    computers[B].append((A, C))
}

let (parent) = dijstra(start: 1, graph: computers)

print(N - 1)
for i in 2...N {
    print(parent[i], i)
}
