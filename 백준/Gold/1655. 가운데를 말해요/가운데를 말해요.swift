//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

// 최대 힙 (내림차순)
struct MaxHeap<T: Comparable> {
    var elements = [T]()

    mutating func insert(_ value: T) {
        elements.append(value)
        var index = elements.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if elements[index] <= elements[parent] { break }
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

    func top() -> T? {
        elements.first
    }

    var count: Int {
        elements.count
    }
}

// 최소 힙 (오름차순)
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

    func bottom() -> T? {
        elements.last
    }

    var count: Int {
        elements.count
    }
}

var maxHeap = MaxHeap<Int>() // 왼쪽 (작은 값)
var minHeap = MinHeap<Int>() // 오른쪽 (큰 값)

// 입력 처리 및 중앙값 유지
let N = Int(readLine()!)!

var result = ""

for _ in 0..<N {
    let num = Int(readLine()!)!

    if maxHeap.count == 0 || num <= maxHeap.top()! {
        maxHeap.insert(num)
    } else {
        minHeap.insert(num)
    }

    if maxHeap.count > minHeap.count + 1 {
        if let move = maxHeap.pop() {
            minHeap.insert(move)
        }
    } else if minHeap.count > maxHeap.count {
        if let move = minHeap.pop() {
            maxHeap.insert(move)
        }
    }

    result += "\(maxHeap.top()!)\n"
}

print(result)