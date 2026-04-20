class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()

        for (i, num) in nums.enumerated() {
            let remain = target - num

            if let index = dict[remain] {
                return [index, i]
            }

            dict[num] = i
        }

        return []
    }
}