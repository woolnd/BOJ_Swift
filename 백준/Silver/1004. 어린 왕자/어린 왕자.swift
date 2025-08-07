//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputCase = Int(readLine()!)!

for _ in 0..<inputCase {
    let info = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
    let startInfo: (Int, Int) = (info[0], info[1])
    let endInfo: (Int, Int) = (info[2], info[3])

    let N = Int(readLine()!)!
    var planets: [(Int, Int, Int)] = []

    func isInside(px: Int, py: Int, cx: Int, cy: Int, r: Int) -> Bool {
        let dx = px - cx
        let dy = py - cy
        
        return dx * dx + dy * dy < r * r
    }

    for _ in 0..<N {
        let input = Array(readLine()!.split(separator: " ").map{ Int(String($0))! })
        planets.append((input[0], input[1], input[2]))
    }
    
    var count = 0

    for planet in planets {
        if isInside(px: startInfo.0, py: startInfo.1, cx: planet.0, cy: planet.1, r: planet.2) != isInside(px: endInfo.0, py: endInfo.1, cx: planet.0, cy: planet.1, r: planet.2)
        {
            count += 1
        }
    }

    print(count)
}