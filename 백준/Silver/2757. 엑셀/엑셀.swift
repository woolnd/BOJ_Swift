import Foundation

while true {
    let input = readLine()!
    if input == "R0C0" { break }

    // 정규식을 사용해 RnCm에서 n과 m 추출
    let pattern = #"R(\d+)C(\d+)"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(location: 0, length: input.utf16.count)

    if let match = regex.firstMatch(in: input, options: [], range: range) {
        let nRange = Range(match.range(at: 1), in: input)!
        let mRange = Range(match.range(at: 2), in: input)!

        let n = Int(input[nRange])! //행
        var m = Int(input[mRange])! //열 -> 영어로 변환
        var alpha : [Character] = []

        while m > 0 {
            m -= 1 // 1-based → 0-based 보정
            let charIndex = m % 26
            alpha.append(Character(UnicodeScalar(charIndex + 65)!)) // 'A' = 65
            m /= 26
        }
        
        alpha.reverse()
        print("\(alpha.map{ String($0) }.joined())\(n)")
    }
}