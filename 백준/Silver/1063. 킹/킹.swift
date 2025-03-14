//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 3 {
    let kingPosition = input[0]
    let stonePosition = input[1]
    
    var kingRow = Int(String(kingPosition.last!))!
    var kingCol = Int(kingPosition.first!.asciiValue! - Character("A").asciiValue!) + 1
    
    var stoneRow = Int(String(stonePosition.last!))!
    var stoneCol = Int(stonePosition.first!.asciiValue! - Character("A").asciiValue!) + 1
    
    let moveCount = Int(input[2]) ?? 0
    var moveArray: [String] = []
    
    for i in 0..<moveCount{
        let move = readLine() ?? ""
        moveArray.append(move)
    }
    
    let moves: [String: (Int, Int)] = ["R": (0, 1), "L": (0, -1), "B": (-1, 0), "T": (1, 0), "RT": (1, 1), "LT": (1, -1), "RB": (-1, 1), "LB": (-1, -1)]
    
    for i in 0..<moveCount {
        let newKingRow = kingRow + moves[moveArray[i]]!.0
        let newKingCol = kingCol + moves[moveArray[i]]!.1
        
        
        if !chkPossibleMove(row: newKingRow, col: newKingCol){
            continue
        }
        
        if newKingRow == stoneRow && newKingCol == stoneCol {
            let newStoneRow = stoneRow + moves[moveArray[i]]!.0
            let newStoneCol = stoneCol + moves[moveArray[i]]!.1
            
            if chkPossibleMove(row: newStoneRow, col: newStoneCol) {
                stoneRow = newStoneRow
                stoneCol = newStoneCol
                
                kingRow = newKingRow
                kingCol = newKingCol
            }
        } else {
            kingRow = newKingRow
            kingCol = newKingCol
        }
        
        
    }
    
    let englishKingCol = Character(UnicodeScalar(kingCol - 1 + Int(Character("A").asciiValue!))!)
    let englishStoneCol = Character(UnicodeScalar(stoneCol - 1 + Int(Character("A").asciiValue!))!)
    
    print("\(englishKingCol)\(kingRow)")
    print("\(englishStoneCol)\(stoneRow)")
    
    func chkPossibleMove(row: Int, col: Int) -> Bool {
        if row <= 0 || row > 8 || col <= 0 || col > 8 {
            return false
        }
        return true
    }
}