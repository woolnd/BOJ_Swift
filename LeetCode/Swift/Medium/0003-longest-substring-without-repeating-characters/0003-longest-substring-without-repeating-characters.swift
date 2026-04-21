class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var countArray = Array(repeating: 0, count: 128)
        var left = 0
        var max_len = 0

        let characters = Array(s)
       
       for right in 0..<characters.count {
            let rightChar = characters[right]
            let rightIdx = Int(rightChar.asciiValue ?? 0)
            countArray[rightIdx] += 1

            while countArray[rightIdx] > 1 {
                let leftChar = characters[left]
                let leftIdx = Int(leftChar.asciiValue ?? 0)
                countArray[leftIdx] -= 1

                left += 1
            }

            max_len = max(max_len, right - left + 1)
        }

        return max_len
    }
}