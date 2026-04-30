class Solution {
    func myAtoi(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var i = 0

        while i < n && chars[i] == " " {
            i += 1
        }

        if i == n { return 0 }

        var sign = 1
        if chars[i] == "+" {
            i += 1
        } else if chars[i] == "-" {
            sign = -1
            i += 1
        }

        var result = 0
        let intMax = Int(Int32.max) 
        let intMin = Int(Int32.min)

        while i < n, let digit = chars[i].wholeNumberValue {
            result = result * 10 + digit

            if sign == 1 && result > intMax {
                return intMax
            } else if sign == -1 && -result < intMin {
                return intMin
            }

            i += 1
        }

        return result * sign
    }
}