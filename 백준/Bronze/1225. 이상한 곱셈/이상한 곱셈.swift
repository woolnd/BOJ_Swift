import Foundation

// 입력 받기
guard let input = readLine()?.split(separator: " "), input.count == 2 else {
    exit(0)
}

let A = input[0]
let B = input[1]

// A와 B 자릿수 합 구하기
let sumA = A.reduce(0) { $0 + Int(String($1))! }
let sumB = B.reduce(0) { $0 + Int(String($1))! }

// 결과 출력
print(sumA * sumB)