//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

if let input = readLine()?.split(separator: " "), input.count == 3{
    let N = Int(input[0]) ?? 0
    let r = Int(input[1]) ?? 0
    let c = Int(input[2]) ?? 0

    var count = 0
    
    
    func Solution(size: Int, row: Int, col:Int){
        if size == 1 {
            if row == r && col == c{
                print(count)
                exit(0)
            }
            count += 1
            return
        }
        
        let half = size / 2
        
        /// 왼쪽 위 -> 오른쪽 위 -> 왼쪽 아래 -> 오른쪽 아래
        if r < row + half, c < col + half {
            Solution(size: half, row: row, col: col) /// 왼쪽 위
        } else {
            count += half * half
        }
        
        if r < row + half, c >= col + half {
            Solution(size: half, row: row, col: col + half) /// 오른쪽  위
        } else {
            count += half * half
        }
        
        if r >= row + half, c < col + half{
            Solution(size: half, row: row + half, col: col) /// 왼쪽 아래
        } else {
            count += half * half
        }
        
        if r >= row + half, c >= col + half{
            Solution(size: half, row: row + half, col: col + half) /// 오른쪽 아래
        } else {
            count += half * half
        }
    }
    
    Solution(size: 1 << N, row: 0, col: 0)
}