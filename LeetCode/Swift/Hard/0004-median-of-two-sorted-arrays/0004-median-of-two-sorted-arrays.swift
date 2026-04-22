class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }

        let m = nums1.count
        let n = nums2.count

        var low = 0
        var high = m

        let halfLen = (m + n + 1) / 2

        while low <= high {
            let i = (low + high) / 2
            let j = halfLen - i
            
            let leftA = (i == 0) ? Int.min : nums1[i - 1]
            let rightA = (i == m) ? Int.max : nums1[i]
        
            let leftB = (j == 0) ? Int.min : nums2[j - 1]
            let rightB = (j == n) ? Int.max : nums2[j]

            if leftA <= rightB && leftB <= rightA {
                if (n + m) % 2 == 1 {
                    return Double(max(leftA, leftB))
                } 

                let leftMax = max(leftA, leftB)
                let rightMin = min(rightA, rightB)
                return Double(leftMax + rightMin) / 2.0

            } else if leftA > rightB {
                high = i - 1
            } else {
                low = i + 1
            }
        }

        return 0.0
    }
}