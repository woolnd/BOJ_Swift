//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 2 {
    let R = Int(input[0]) ?? 0
    let C = Int(input[1]) ?? 0
    
    var maps: [[String]] = Array(repeating: [], count: R)
    var groundArray: [(Int, Int)] = []
    
    for i in 0..<R {
        if let inputCol = readLine() {
            let col = inputCol.map { String($0) }
            if col.count == C {
                maps[i] = col
            }
            
            for j in 0..<C {
                if maps[i][j] == "X" {
                    groundArray.append((i, j))
                }
            }
        }
    }
    
    var newMaps = maps
    let chkAdjacentSea: [(Int, Int)] = [(0, 1), (0, -1), (-1, 0), (1, 0)]
    
    var index = 0
    while index < groundArray.count {
        var count = 0
        let row = groundArray[index].0
        let col = groundArray[index].1
        index += 1
        
        for i in 0..<chkAdjacentSea.count {
            let nRow = row + chkAdjacentSea[i].0
            let nCol = col + chkAdjacentSea[i].1
            
            if nRow < 0 || nRow >= R || nCol < 0 || nCol >= C || maps[nRow][nCol] == "." {
                count += 1
            }
        }
        
        if count >= 3 {
            newMaps[row][col] = "."
        }
    }

    // 지도 축소 부분 추가
    var minRow = R, maxRow = 0, minCol = C, maxCol = 0
    var hasLand = false

    for i in 0..<R {
        for j in 0..<C {
            if newMaps[i][j] == "X" {
                hasLand = true
                minRow = min(minRow, i)
                maxRow = max(maxRow, i)
                minCol = min(minCol, j)
                maxCol = max(maxCol, j)
            }
        }
    }

    if !hasLand {
        print(".")
    } else {
        for i in minRow...maxRow {
            print(newMaps[i][minCol...maxCol].joined())
        }
    }
}
