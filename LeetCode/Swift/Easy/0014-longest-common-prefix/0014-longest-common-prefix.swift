class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }

        let base = Array(strs[0])

        for i in 0..<base.count {
            let char = base[i]
        
            for j in 1..<strs.count {
                let currentStr = Array(strs[j])

                if i == currentStr.count || currentStr[i] != char {
                    return String(base[0..<i])
                }
            }
        }

        return strs[0]
    }
}