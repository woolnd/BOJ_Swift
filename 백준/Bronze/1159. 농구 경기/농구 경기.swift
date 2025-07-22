import Foundation

let N = Int(readLine()!)!
var alpha = Array(repeating: 0, count: 26)

for _ in 0..<N {
    let name = readLine()!
    let index = Int(name.first!.asciiValue! - 97)
    alpha[index] += 1
}

var result = ""

for i in 0..<26 {
    if alpha[i] >= 5 {
        let character = Character(UnicodeScalar(i + 97)!)
        result += String(character)
    }
}

print(result.isEmpty ? "PREDAJA" : result)