//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct AbsoluteHeap {
    private var heap: [(abs: Int, value: Int)] = []
    
    mutating func push(_ x: Int) {
        heap.append((abs(x), x))
        siftUp(heap.count - 1)
    }
    
    mutating func pop() -> Int {
        if heap.isEmpty { return 0 }
        heap.swapAt(0, heap.count - 1)
        let result = heap.removeLast().value
        siftDown(0)
        return result
    }
    
    mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func siftDown(_ index: Int) {
        var parent = index
        let count = heap.count
        
        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            var child = parent
            
            if left < count && heap[left] < heap[child] {
                child = left
            }
            
            if right < count && heap[right] < heap[child] {
                child = right
            }
            
            if child == parent { break }
            
            heap.swapAt(parent, child)
            parent = child
        }
    }
}


let N = Int(readLine()!)!

var heap = AbsoluteHeap()
for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input != 0 {
        heap.push(input)
    } else {
        print(heap.pop())
    }
}