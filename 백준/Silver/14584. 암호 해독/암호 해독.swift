//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

var input = readLine()!
let count = Int(readLine()!)!
var list: [String] = []

for i in 0..<count {
    let inputWord = readLine()!
    list.append(inputWord)
}


for k in 1...25 {
    for word in list {
        let shifted = shiftString(word, by: k)
        if input.contains(shifted) {
            input = shiftString(input, by: 26 - k)
            break
        }
    }
}

print(input)

func shiftChar(_ ch: Character, by k: Int) -> Character {
    guard let v = ch.unicodeScalars.first?.value else { return ch }
    if (97...122).contains(v) {         // 'a'...'z'
        let base: UInt32 = 97
        return Character(UnicodeScalar((v - base + UInt32(k)) % 26 + base)!)
    } else {
        return ch                               // 공백/구두점 등은 그대로
    }
}


// 문자열 전체를 k칸 미루기
func shiftString(_ s: String, by k: Int) -> String {
    String(s.map { shiftChar($0, by: k) })
}