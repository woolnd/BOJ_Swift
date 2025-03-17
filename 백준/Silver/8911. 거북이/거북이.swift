//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine() ?? "0") ?? 0

for i in 0..<inputCase {
    var moves: [(Int, Int, String)] = [(0, 0, "Up")]
    var commands = readLine()!.map{ String($0) }
    
    while commands.count != 0 {
        var command = commands.removeFirst()
        var (y, x, direction) = moves.last!
        
        if direction == "Up" {
            if command == "F"{
                moves.append((y+1, x, "Up"))
            } else if command == "B"{
                moves.append((y-1, x, "Up"))
            } else if command == "L"{
                moves.append((y, x, "Left"))
            } else {
                moves.append((y, x, "Right"))
            }
        } else if direction == "Down" {
            if command == "F"{
                moves.append((y-1, x, "Down"))
            } else if command == "B"{
                moves.append((y+1, x, "Down"))
            } else if command == "L"{
                moves.append((y, x, "Right"))
            } else {
                moves.append((y, x, "Left"))
            }
        } else if direction == "Left" {
            if command == "F"{
                moves.append((y, x-1, "Left"))
            } else if command == "B"{
                moves.append((y, x+1, "Left"))
            } else if command == "L"{
                moves.append((y, x, "Down"))
            } else {
                moves.append((y, x, "Up"))
            }
        } else {
            if command == "F"{
                moves.append((y, x+1, "Right"))
            } else if command == "B"{
                moves.append((y, x-1, "Right"))
            } else if command == "L"{
                moves.append((y, x, "Up"))
            } else {
                moves.append((y, x, "Down"))
            }
        }
    }
    
    var minX = 0
    var maxX = 0
    
    var minY = 0
    var maxY = 0
    
    for i in 1..<moves.count{
        
        let nowY = moves[i].0
        let nowX = moves[i].1
        
        minY = min(minY, nowY)
        maxY = max(maxY, nowY)
        
        minX = min(minX, nowX)
        maxX = max(maxX, nowX)
    }

    print( (maxY - minY) * (maxX - minX) )
}