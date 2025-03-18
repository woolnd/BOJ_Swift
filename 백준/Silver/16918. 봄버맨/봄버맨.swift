//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let inputCase = readLine()?.split(separator: " "), inputCase.count == 3{
    let R = Int(inputCase[0])!
    let C = Int(inputCase[1])!
    let N = Int(inputCase[2])!
    
    var bombs: [[String]] = Array(repeating: [], count: R)
    
    for i in 0..<R{
        let column = readLine()!.map{ String($0) }
        if column.count == C {
            bombs[i] = column
        }
    }
    
    // 1초일 경우 초기 상태 그대로 출력
    if N == 1 {
        for row in bombs {
            print(row.joined())
        }
        exit(0) // 프로그램 종료
    }
    
    // 2초일 경우 모든 칸이 폭탄으로 채워짐
    if N % 2 == 0 {
        for _ in 0..<R {
            print(String(repeating: "O", count: C))
        }
        exit(0)
    }
    
    let totalBombs: [[String]] = Array(repeating: Array(repeating: "O", count: C), count: R) //폭탄이 전체 위치할때
    var resultBombs: [[String]] = bombs //결과값
    
    let dy = [0, 0, -1, 1]
    let dx = [-1, 1, 0, 0]
    
    func explode(_ grid: [[String]]) -> [[String]] {
        var newGrid = totalBombs
        for i in 0..<R {
            for j in 0..<C {
                if grid[i][j] == "O" {
                    newGrid[i][j] = "."
                    for d in 0..<4 {
                        let ny = i + dy[d]
                        let nx = j + dx[d]
                        if ny >= 0, ny < R, nx >= 0, nx < C {
                            newGrid[ny][nx] = "."
                        }
                    }
                }
            }
        }
        return newGrid
    }
    
    let afterThreeSec = explode(bombs) // 3초 후 폭발
    let afterFiveSec = explode(afterThreeSec) // 5초 후 폭발
    
    // 5초 이후부터는 패턴 반복 (N이 3이면 3초 후, 5면 5초 후 상태)
    resultBombs = (N % 4 == 3) ? afterThreeSec : afterFiveSec
    
    for i in 0..<R {
        print(resultBombs[i].joined())
    }
}