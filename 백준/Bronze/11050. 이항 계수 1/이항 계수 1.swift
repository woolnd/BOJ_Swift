import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
var K = input[1]
K = min(K, N)

var dp = Array(repeating: Array(repeating: 0, count: K + 1), count: N + 1)

// 기저값
for i in 0...N {
    dp[i][0] = 1
    if i <= K { dp[i][i] = 1 }
}

// 점화식: 1 ≤ j < i  ->  j ∈ [1 ... min(i-1, K)]
if K >= 1 {
    for i in 1...N {
        let lim = min(i - 1, K)
        if lim >= 1 {
            for j in 1...lim {
                dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
            }
        }
    }
}

print(dp[N][K])