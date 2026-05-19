class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }

        let mapping: [Character: [String]] = 
                    [ "2" : ["a", "b", "c"],
                        "3" : ["d", "e", "f"],
                        "4" : ["g", "h", "i"],
                        "5" : ["j", "k", "l"],
                        "6" : ["m", "n", "o"],
                        "7" : ["p", "q", "r", "s"],
                        "8" : ["t", "u", "v"],
                        "9" : ["w", "x", "y", "z"]
                        ]

        let digitArray = Array(digits)
        var result = [String]()

        func backtrack(_ index: Int, _ currentString: String) {
            if index == digitArray.count {
                result.append(currentString)
                return 
            }

            let currentDigit = digitArray[index]

            if let letters = mapping[currentDigit] {
                for letter in letters {
                    backtrack(index + 1, currentString + letter)
                }
            }
        }

        backtrack(0, "")

        return result
    }
}