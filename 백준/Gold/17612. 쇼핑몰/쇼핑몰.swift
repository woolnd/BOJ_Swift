//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct Customer {
    let id: Int
    let finishTime: Int
    let registerID: Int
}

struct RegisterPQ {
    private var heap: [(freeTime: Int, id: Int)] = []

    var isEmpty: Bool { heap.isEmpty }

    mutating func push(_ item: (Int, Int)) {
        heap.append(item)
        siftUp(from: heap.count - 1)
    }

    mutating func pop() -> (freeTime: Int, id: Int) {
        if heap.count == 1 { return heap.removeLast() }
        let value = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        return value
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && isHigherPriority(heap[child], heap[parent]) {
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

            if left < heap.count && isHigherPriority(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && isHigherPriority(heap[right], heap[candidate]) {
                candidate = right
            }
            if candidate == parent { return }

            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }

    // 우선순위 결정: 시간 오름차순, 번호 오름차순
    private func isHigherPriority(_ a: (freeTime: Int, id: Int), _ b: (freeTime: Int, id: Int)) -> Bool {
        if a.freeTime != b.freeTime {
            return a.freeTime < b.freeTime
        }
        return a.id < b.id
    }
}

// --- 메인 로직 ---

// 입력 처리
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], K = input[1]

var registerPQ = RegisterPQ()
// 초기 상태: 모든 계산대는 0초에 비어있음
for i in 1...K {
    registerPQ.push((0, i))
}

var exitList: [Customer] = []

for _ in 0..<N {
    let customerInput = readLine()!.split(separator: " ").map { Int($0)! }
    let id = customerInput[0]
    let w = customerInput[1]
    
    // 가장 빨리 비는 계산대를 배정받음
    let bestRegister = registerPQ.pop()
    let finishTime = bestRegister.freeTime + w
    
    // 이 고객의 종료 정보 기록
    exitList.append(Customer(id: id, finishTime: finishTime, registerID: bestRegister.id))
    
    // 계산대 업데이트해서 다시 넣기
    registerPQ.push((finishTime, bestRegister.id))
}

// 3. 퇴장 조건에 맞춰 정렬
// 조건: 시간 오름차순 -> 시간이 같다면 계산대 번호 내림차순
exitList.sort {
    if $0.finishTime != $1.finishTime {
        return $0.finishTime < $1.finishTime
    }
    return $0.registerID > $1.registerID
}

// 4. 결과 계산 (Int64 주의)
var totalAnswer: Int64 = 0
for i in 0..<N {
    let order = Int64(i + 1)
    let customerID = Int64(exitList[i].id)
    totalAnswer += order * customerID
}

print(totalAnswer)

