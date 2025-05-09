//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!)!

var tree: [[Int]] = Array(repeating: [-1, -1], count: 26)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    let parent = Int(UnicodeScalar(input[0])!.value - UnicodeScalar("A").value)
    let left = input[1] == "." ? -1 : Int(UnicodeScalar(input[1])!.value - UnicodeScalar("A").value)
    let right = input[2] == "." ? -1 : Int(UnicodeScalar(input[2])!.value - UnicodeScalar("A").value)
    
    tree[parent][0] = left
    tree[parent][1] = right
}

var resultPre: [Int] = []
var resultIn: [Int] = []
var resultPost: [Int] = []

//전위순회
func preorder(_ node: Int) {
    if node == -1 { return }
    
    resultPre.append(node)
    preorder(tree[node][0])
    preorder(tree[node][1])
}

func inorder(_ node: Int) {
    if node == -1 { return }
    
    inorder(tree[node][0])
    resultIn.append(node)
    inorder(tree[node][1])
}

func postorder(_ node: Int) {
    if node == -1 { return }
    
    postorder(tree[node][0])
    postorder(tree[node][1])
    resultPost.append(node)
    
}


preorder(0)
inorder(0)
postorder(0)

for r in resultPre {
    print(Character(UnicodeScalar(r + 65)!), terminator: "")
}
print()

for r in resultIn {
    print(Character(UnicodeScalar(r + 65)!), terminator: "")
}
print()

for r in resultPost {
    print(Character(UnicodeScalar(r + 65)!), terminator: "")
}