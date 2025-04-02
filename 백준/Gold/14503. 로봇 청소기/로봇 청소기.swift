//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = readLine()!.split(separator: " ").map { Int($0)! }
let N = inputCase[0], M = inputCase[1]

let position = readLine()!.split(separator: " ").map { Int($0)! }
var y = position[0]
var x = position[1]
var dir = position[2]

var rooms: [[Int]] = []

for _ in 0..<N {
    rooms.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var clean = Array(repeating: Array(repeating: false, count: M), count: N)

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

func rotateLeft(_ d: Int) -> Int {
    return (d + 3) % 4
}

func backDir(_ d: Int) -> Int {
    return (d + 2) % 4
}

func solution() -> Int {
    var count = 0

    while true {
        // 1. 현재 칸 청소
        if !clean[y][x] {
            clean[y][x] = true
            count += 1
        }

        var moved = false

        // 2. 왼쪽 방향부터 차례로 탐색
        for _ in 0..<4 {
            dir = rotateLeft(dir)
            let ny = y + dy[dir]
            let nx = x + dx[dir]

            if ny >= 0 && ny < N && nx >= 0 && nx < M {
                if rooms[ny][nx] == 0 && !clean[ny][nx] {
                    y = ny
                    x = nx
                    moved = true
                    break
                }
            }
        }

        if !moved {
            // 3. 네 방향 모두 청소 or 벽 => 후진
            let back = backDir(dir)
            let by = y + dy[back]
            let bx = x + dx[back]

            if by >= 0 && by < N && bx >= 0 && bx < M && rooms[by][bx] == 0 {
                y = by
                x = bx
                // dir 그대로
            } else {
                break  // 후진도 못하면 종료
            }
        }
    }

    return count
}

print(solution())