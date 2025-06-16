//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct MinHeap<T: Comparable> {
    var elements = [T]()

    mutating func insert(_ value: T) {
        elements.append(value)
        var index = elements.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if elements[index] >= elements[parent] { break }
            elements.swapAt(index, parent)
            index = parent
        }
    }

    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let result = elements.removeLast()
        var index = 0
        while index < elements.count {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var candidate = index
            if left < elements.count && elements[left] < elements[candidate] {
                candidate = left
            }
            if right < elements.count && elements[right] < elements[candidate] {
                candidate = right
            }
            if candidate == index { break }
            elements.swapAt(index, candidate)
            index = candidate
        }
        return result
    }

    func top() -> T? {
        elements.first
    }

    var count: Int {
        elements.count
    }
}


let N = Int(readLine()!)!
var list: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    let start = Int(input[0])!
    let end = Int(input[1])!
    
    list.append((start, end))
}

list.sort { $0.0 < $1.0 }

var minHeap = MinHeap<Int>()
var count = 0

for (start, end) in list {
    if let earliestEnd = minHeap.top(), earliestEnd <= start {
        _ = minHeap.pop()
    }
    minHeap.insert(end)
}

print(minHeap.count)
