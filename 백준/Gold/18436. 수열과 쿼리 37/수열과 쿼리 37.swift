//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

final class FastIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init() {
        buffer = Array(try! FileHandle.standardInput.readDataToEndOfFile()) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        guard index < buffer.count else { return 0 }
        return buffer[index]
    }

    func readInt() -> Int {
        var sum = 0
        var now = read()
        
        while now <= 32 {
            if now == 0 { return 0 }
            now = read()
        }
        
        while now >= 48 && now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        return sum
    }
}

let io = FastIO()
let N = io.readInt()

var A = [Int](repeating: 0, count: N + 1)
for i in 1...N {
    A[i] = io.readInt()
}

var tree = [Int](repeating: 0, count: N + 1)

func update(i: Int, diff: Int) {
    var idx = i
    while idx <= N {
        tree[idx] += diff
        idx += (idx & -idx)
    }
}

func sum(i: Int) -> Int {
    var idx = i
    var result = 0
    while idx > 0 {
        result += tree[idx]
        idx -= (idx & -idx)
    }
    return result
}

// 초기 데이터 트리 반영
for i in 1...N {
    if A[i] % 2 == 0 {
        update(i: i, diff: 1)
    }
}

let M = io.readInt()
var output = ""

for _ in 0..<M {
    let type = io.readInt()
    let a = io.readInt()
    let b = io.readInt()
    
    if type == 1 {
        let oldIsEven = A[a] % 2 == 0
        let newIsEven = b % 2 == 0
        
        if oldIsEven && !newIsEven {
            update(i: a, diff: -1)
        } else if !oldIsEven && newIsEven {
            update(i: a, diff: 1)
        }
        
        A[a] = b
    } else if type == 2 {
        output += "\(sum(i: b) - sum(i: a - 1))\n"
    } else {
        let totalLen = b - a + 1
        let evenCount = sum(i: b) - sum(i: a - 1)
        output += "\(totalLen - evenCount)\n"
    }
}

print(output)