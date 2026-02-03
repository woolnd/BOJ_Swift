//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Array(readLine()!)
var stack: [Character] = []
var output = ""

func prev(_ ch: Character) -> Int {
    switch ch {
    case "+", "-": return 1
    case "*", "/": return 2
    default: return 0
    }
}

for ch in input {
    if ch.isLetter {
        output.append(ch)
    } else if ch == "("{
        stack.append(ch)
    } else if ch == ")"{
        while let top = stack.last, top != "(" {
            output.append(stack.removeLast())
        }
        _ = stack.removeLast()
    } else {
        while let top = stack.last, top != "(", prev(top) >= prev(ch) {
            output.append(stack.removeLast())
        }
        stack.append(ch)
    }
}

while let top = stack.last {
    output.append(stack.removeLast())
}

print(output)