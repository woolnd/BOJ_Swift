//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine() ?? "0") ?? 0

func chkLength(k: Int) -> Int{
    if k == 0{
        return 3
    } else {
        return 2 * chkLength(k: k - 1) + (k + 3)
    }
}

func findMoo(n:Int, k: Int) -> Character {
    if k == 0 {
        return (n == 1) ? "m" : "o"
    }
    
    let prevLen = chkLength(k: k - 1)
    
    if n <= prevLen { // S(k-1)의 앞부분
        return findMoo(n: n, k: k - 1)
    } else if n > prevLen + (k + 3) { // S(k-1)의 뒷부분
        return findMoo(n: n - prevLen - (k + 3), k: k - 1)
    } else { // 중앙 부분
        return (n - prevLen == 1) ? "m" : "o"
    }
}

var k = 0
var length = 3
while length < N {
    k += 1
    length = 2 * length + (k + 3)
}

print(findMoo(n: N, k: k))