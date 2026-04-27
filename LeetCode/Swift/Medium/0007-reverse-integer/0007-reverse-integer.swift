class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var result = 0

        while num != 0 {
            let pop = num % 10
            num /= 10

            if result > Int32.max / 10 || (result == Int32.max / 10 && pop > 7) {
                return 0
            }
    
            if result < Int32.min / 10 || (result == Int32.min / 10 && pop < -8) {
                return 0
            }

            result = result * 10 + pop
        }

        return result
    }
}