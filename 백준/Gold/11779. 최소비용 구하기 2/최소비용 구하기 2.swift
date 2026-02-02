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

let INF = Int.max / 4

func dijkstra(start: Int, graph: [[(Int, Int)]]) -> (dist: [Int], prev: [Int]) {
    var dist = Array(repeating: INF, count: graph.count)
    var prev = Array(repeating: 0, count: graph.count)
    dist[start] = 0

    var pq = PriorityQueue()
    pq.push((0, start))

    while !pq.isEmpty {
        let (cost, now) = pq.pop()
        if dist[now] < cost { continue }

        for (next, w) in graph[now] {
            let nextCost = cost + w
            if nextCost < dist[next] {
                dist[next] = nextCost
                prev[next] = now
                pq.push((nextCost, next))
            }
        }
    }
    return (dist, prev)
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var bus: [[(Int, Int)]] = Array(repeating: [(Int, Int)](), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    
    bus[a].append((b, c))
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let start = input[0], end = input[1]

let (dist, prev) = dijkstra(start: start, graph: bus)

print(dist[end])

var path: [Int] = []
var cur = end

while cur != 0 {
    path.append(cur)
    if cur == start { break }
    cur = prev[cur]
}

path.reverse()
print(path.count)
print(path.map{ String($0) }.joined(separator: " "))