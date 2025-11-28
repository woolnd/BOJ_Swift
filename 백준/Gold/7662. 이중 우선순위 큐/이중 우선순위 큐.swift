//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct maxHeap {
    var elements = [(Int, Int)]()
    
    mutating func insert(_ value: Int, _ idx: Int){
        elements.append((value, idx))
        var index = elements.count - 1
        
        while index > 0 {
            let parent = (index - 1) / 2
            
            if elements[index] <= elements[parent] { break }
            elements.swapAt(index, parent)
            index = parent
        }
    }
    
    mutating func pop() -> (Int, Int)? {
        guard !elements.isEmpty else { return nil }
        
        elements.swapAt(0, elements.count - 1)
        let result = elements.removeLast()
        var index = 0
        
        while index < elements.count {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var candidate = index
            
            if left < elements.count && elements[left] > elements[candidate] {
                candidate = left
            }
            
            if right < elements.count && elements[right] > elements[candidate] {
                candidate = right
            }
            
            if candidate == index { break }
            elements.swapAt(index, candidate)
            index = candidate
        }
        
        return result
    }

    func top() -> Int? {
        elements.first?.0
    }
}

struct minHeap{
    var elements = [(Int, Int)]()

    mutating func insert(_ value: Int, _ idx: Int) {
        elements.append((value, idx))
        var index = elements.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if elements[index] >= elements[parent] { break }
            elements.swapAt(index, parent)
            index = parent
        }
    }

    mutating func pop() -> (Int, Int)? {
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

    func top() -> Int? {
        elements.first?.0
    }
}


let T = Int(readLine()!)!

for _ in 0..<T {
    let k = Int(readLine()!)!
    
    var maxHeap = maxHeap()
    var minHeap = minHeap()
    
    var visited = Array(repeating: true, count: k)
    var id = 0
    
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{ String($0) }
        
        let s = input[0]
        let n = Int(input[1])!
        
        if s == "I" {
            minHeap.insert(n, id)
            maxHeap.insert(n, id)
            
            id += 1
        } else if s == "D" && n == 1 {
            while let (value, idx) = maxHeap.pop() {
                if visited[idx] {
                    visited[idx] = false
                    break
                }
            }
        } else if s == "D" && n == -1 {
            while let (value, idx) = minHeap.pop() {
                if visited[idx] {
                    visited[idx] = false
                    break
                }
            }
        }
    }
    
    while let (_, idx) = maxHeap.elements.first, !visited[idx] {
        _ = maxHeap.pop()
    }

    while let (_, idx) = minHeap.elements.first, !visited[idx] {
        _ = minHeap.pop()
    }

    if maxHeap.elements.isEmpty || minHeap.elements.isEmpty {
        print("EMPTY")
    } else {
        let maxValue = maxHeap.elements.first!.0
        let minValue = minHeap.elements.first!.0
        print("\(maxValue) \(minValue)")
    }
}