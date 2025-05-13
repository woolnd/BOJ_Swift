//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let file = FileIO()
let n = file.readInt()

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
}

var heap = MinHeap<Int>()

for _ in 0..<n {
    for _ in 0..<n {
        let num = file.readInt()
        if heap.elements.count < n {
            heap.insert(num)
        } else if let min = heap.top(), num > min {
            heap.pop()
            heap.insert(num)
        }
    }
}

print(heap.top()!)


final class FileIO {
    private var buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var num = 0
        var isNegative = false
        var byte = read()
        while byte == 10 || byte == 32 { byte = read() } // 공백, 개행 무시
        if byte == 45 { isNegative = true; byte = read() } // 음수
        while byte >= 48, byte <= 57 {
            num = num * 10 + Int(byte - 48)
            byte = read()
        }
        return num * (isNegative ? -1 : 1)
    }
}
