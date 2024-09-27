let word = Dictionary(readLine()!.uppercased().map{ ($0, 1) }, uniquingKeysWith: +)
var maxCount = 0
var maxAlphabet: Character = "a"

word.keys.forEach({ alphabet in
    if maxCount < word[alphabet]! {
        maxCount = word[alphabet]!
        maxAlphabet = alphabet
    } else if maxCount == word[alphabet]! {
        maxAlphabet = "?"
    }
})

print(maxAlphabet)