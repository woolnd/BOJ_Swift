class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true
        
        let sArr = Array(s)
        let pArr = Array(p)

        for i in 0...s.count {
            for j in 1...p.count {

                if pArr[j-1] != "*" {
                    if i > 0 && (sArr[i-1] == pArr[j-1] || pArr[j-1] == ".") {
                        dp[i][j] = dp[i-1][j-1]
                    }
                } else {
                    dp[i][j] = dp[i][j-2]

                    if i > 0 && (sArr[i-1] == pArr[j-2] || pArr[j-2] == ".") {
                        dp[i][j] = dp[i][j] || dp[i-1][j]
                    }
                }
            }
        }

        return dp[sArr.count][pArr.count]
    }
}