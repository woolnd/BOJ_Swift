import Foundation

let inputNB = readLine()!.split(separator: " ").map { Int64($0)! }
let N = Int(inputNB[0])
let B = inputNB[1]

var A = Array(repeating: Array(repeating: 0, count: N), count: N)
for i in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! % 1000 } // ✅ 여기
    A[i] = row
}

func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0..<N {
        for j in 0..<N {
            var sum = 0
            for k in 0..<N {
                sum += A[i][k] * B[k][j]
            }
            result[i][j] = sum % 1000
        }
    }
    return result
}

func power(_ A: [[Int]], _ exp: Int64) -> [[Int]] {
    if exp == 1 { return A } 
    if exp == 0 {
        var I = Array(repeating: Array(repeating: 0, count: N), count: N)
        for i in 0..<N { I[i][i] = 1 }
        return I
    }

    let half = power(A, exp / 2)
    let squared = multiply(half, half)

    return (exp % 2 == 0) ? squared : multiply(squared, A)
}

let answer = power(A, B)
for i in 0..<N {
    print(answer[i].map(String.init).joined(separator: " "))
}