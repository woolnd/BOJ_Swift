class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let n = nums.count
        guard n >= 4 else { return [] }

        let sortedNums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<n-3 {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }

            for j in i+1..<n-2 {
                if j > i + 1 && sortedNums[j] == sortedNums[j - 1] { continue }

                var left = j + 1
                var right = n - 1

                while left < right {
                        let sum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]

                    if sum == target {
                        result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])

                        while left < right && sortedNums[left] == sortedNums[left + 1] { left += 1 }
                        while left < right && sortedNums[right] == sortedNums[right - 1] { right -= 1 }

                        left += 1
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }

        return result
    }
}