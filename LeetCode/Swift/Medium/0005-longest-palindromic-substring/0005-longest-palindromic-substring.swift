class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var start = 0
        var maxLength = 0
        
        for i in 0..<chars.count {
            let len1 = expand(chars, i, i)
            let len2 = expand(chars, i, i + 1)
            
            let currentMax = max(len1, len2)
            if currentMax > maxLength {
                maxLength = currentMax
                start = i - (currentMax - 1) / 2
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(startIndex, offsetBy: maxLength)
        return String(s[startIndex..<endIndex])
    }

    func expand(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
}