//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

// 가능한 모든 세 자리 숫자 (1~9, 중복X)
var bases: [Int] = []

func generateCases(_ number: inout [Int]) {
    if number.count == 3 {
        let num = Int(number.map { String($0) }.joined())!
        bases.append(num)
        return
    }
    
    for i in 1...9 { // 1~9만 사용 (0 제외)
        if !number.contains(i) { // 중복 방지
            number.append(i)
            generateCases(&number)
            number.removeLast()
        }
    }
}

var tempNumbers: [Int] = []
generateCases(&tempNumbers) // 가능한 모든 세 자리 수 생성

let inputCase = Int(readLine() ?? "0") ?? 0

for _ in 0..<inputCase {
    if let input = readLine()?.split(separator: " "), input.count == 3 {
        let number = Array(input[0]) // 입력 숫자 (문자 배열로 변환)
        let strike = Int(input[1]) ?? 0
        let ball = Int(input[2]) ?? 0

        var newBase: [Int] = []

        for base in bases {
            let baseStr = Array(String(base)) // 현재 검사할 숫자
            
            var chkStrike = 0
            var chkBall = 0

            // 스트라이크 계산
            for i in 0..<3 {
                if baseStr[i] == number[i] {
                    chkStrike += 1
                }
            }

            // 볼 계산 (스트라이크 제외한 숫자만 검사)
            for i in 0..<3 {
                if baseStr[i] != number[i], number.contains(baseStr[i]) {
                    chkBall += 1
                }
            }

            // 스트라이크와 볼 개수가 일치하면 유효한 후보로 추가
            if strike == chkStrike && ball == chkBall {
                newBase.append(base)
            }
        }

        bases = newBase // 유효한 숫자로 갱신
    }
}

print(bases.count) // 남은 가능한 숫자 개수 출력
