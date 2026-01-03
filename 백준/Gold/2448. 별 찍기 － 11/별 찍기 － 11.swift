//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let N = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let W = 2 * N - 1

var board = Array(repeating: Array(repeating: UInt8(32), count: W), count: N)

func draw(_ h: Int, _ r: Int, _ c: Int) {
    if h == 3 {
        board[r][c] = 42 // *
        board[r + 1][c - 1] = 42
        board[r + 1][c + 1] = 42
        for i in (c - 2)...(c + 2) {
            board[r + 2][i] = 42
        }
        return
    }
    let half = h / 2
    draw(half, r, c)
    draw(half, r + half, c - half)
    draw(half, r + half, c + half)
}

draw(N, 0, N - 1)

var output = [UInt8]()
output.reserveCapacity(N * (W + 1))

for i in 0..<N {
    output += board[i]
    output.append(10) // \n
}

FileHandle.standardOutput.write(Data(output))
