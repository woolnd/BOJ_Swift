class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }

        var num = x
        var result = 0

        while num > result {
            result = result * 10 + num % 10
            num /= 10
        }

        return num == result || num == result / 10
    }
}