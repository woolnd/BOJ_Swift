//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

struct Heap<T: Comparable>{
    var elements: [T] = []
    private let comparer: (T, T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(element: T){
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            
            return
        }
        
        elements.append(element)
        swimUP(index: elements.count - 1)
    }
    
    mutating private func swimUP(index: Int){
        var index = index
        
        while index > 1 && comparer(elements[index], elements[index / 2]){
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }

    mutating func pop() -> T? {
        if elements.count < 2{
            return nil
        }
        
        elements.swapAt(1, elements.count - 1)
        let deletedElement = elements.removeLast()
        diveDown(index: 1)
        
        if elements.count == 1{
            elements = []
        }
        
        return deletedElement
    }
    
    mutating private func diveDown(index: Int) {
        var swapIndex = index
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        var isSwap = false
        
        if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]){
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]){
            swapIndex = rightIndex
            isSwap = true
        }
        
        if isSwap {
            elements.swapAt(swapIndex, index)
            diveDown(index: swapIndex)
        }
    }
    
    mutating func totalSum() -> Int{
        var cost = 0
        
        while elements.count > 2{
            let first = pop() as! Int
            let second = pop() as! Int
            
            let merged = first + second
            cost += merged
            insert(element: merged as! T)
        }
        
        return cost
    }
    
    
}

let N = Int(readLine()!)!
var minHeap = Heap<Int>(comparer: <)

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    minHeap.insert(element: input)
}

print(minHeap.totalSum())