class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let temp = nums.sorted()
        var result = [[Int]]()
        
        for i in 0..<temp.count {
            if i > 0 && temp[i] == temp[i-1]{
                continue
            }

            var left = i + 1
            var right = temp.count - 1

            while left < right {
                let sum = temp[i] + temp[left] + temp[right]

                if sum == 0 {
                    result.append([temp[i], temp[left], temp[right]])

                    while left < right && temp[left] == temp[left+1] { left += 1 }
                    while left < right && temp[right] == temp[right-1] { right -= 1 }

                    left += 1
                    right -= 1
                } else if sum < 0{
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }
}