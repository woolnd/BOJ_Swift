//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var preorder: [Int] = []

while let input = readLine(), let n = Int(input) {
    preorder.append(n)
}

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func buildTree(_ preorder: [Int], _ start: Int, _ end: Int) -> TreeNode? {
    if start >= end { return nil }
    
    let rootValue = preorder[start]
    let root = TreeNode(value: rootValue)
    
    var mid = start + 1
    
    while mid < end && preorder[mid] < rootValue {
        mid += 1
    }
    
    root.left = buildTree(preorder, start+1, mid)
    root.right = buildTree(preorder, mid, end)
    
    return root
}

func postorder(_ node: TreeNode?) {
    guard let node = node else { return }
    
    postorder(node.left)
    postorder(node.right)
    print(node.value)
}

if let node = buildTree(preorder, 0, preorder.count) {
    postorder(node)
}
