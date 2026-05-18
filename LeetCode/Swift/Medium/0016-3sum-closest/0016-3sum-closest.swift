class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        let n = sortedNums.count
        var closetSum = sortedNums[0] + sortedNums[1] + sortedNums[2]

        for i in 0..<n-2 {
            var left = i + 1
            var right = n - 1

            while left < right {
                let currentSum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                if currentSum == target {
                    return currentSum
                }

                if abs(target - currentSum) < abs(target - closetSum) {
                    closetSum = currentSum
                }

                if currentSum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return closetSum
    }
}