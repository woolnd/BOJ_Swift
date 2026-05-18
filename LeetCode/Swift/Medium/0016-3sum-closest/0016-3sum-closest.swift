class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        var closetSum = nums[0] + nums[1] + nums[2]

        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                for k in j+1..<n {
                    let currentSum = nums[i] + nums[j] + nums[k]

                    if abs(target - closetSum) > abs(target - currentSum) {
                        closetSum = currentSum
                    }
                }
            }
        }

        return closetSum
    }
}