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


func dijkstra(start: Int, graph: [[(Int, Int)]], n: Int) -> [Int] {
    let INF = Int.max / 4
    var dist = Array(repeating: INF, count: n + 1)
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
                pq.push((nextCost, next))
            }
        }
    }
    return dist
}

let inputNE = readLine()!.split(separator: " ").map{ Int($0)! }
let N = inputNE[0], E = inputNE[1]

var graph = Array(repeating: [(to: Int, w: Int)](), count: N + 1)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    
    graph[a].append((b, c))
    graph[b].append((a, c))
}

let inputUV = readLine()!.split(separator: " ").map{ Int($0)! }
let u = inputUV[0], v = inputUV[1]


let dist1 = dijkstra(start: 1, graph: graph, n: N)
let distU = dijkstra(start: u, graph: graph, n: N)
let distV = dijkstra(start: v, graph: graph, n: N)


let path1 = dist1[u] + distU[v] + distV[N]
let path2 = dist1[v] + distV[u] + distU[N]

let INF = Int.max / 4
let ans = min(path1, path2)

print(ans >= INF ? -1 : ans)
