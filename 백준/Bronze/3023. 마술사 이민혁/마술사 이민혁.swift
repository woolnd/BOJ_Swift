import Foundation

if let input = readLine()?.split(separator: " ") {
    let column = Int(input[0])!
    let row = Int(input[1])!
    
    var card: [[String]] = Array(repeating: Array(repeating: "", count: row), count: column)
    
    for y in 0..<column {
        if let xInput = readLine() {
            let characters = Array(xInput)  // 문자열을 문자 배열로 변환
            for x in 0..<row {
                card[y][x] = String(characters[x])  // 각 문자를 String으로 변환하여 할당
            }
        }
    }
    
    var resultCard: [[String]] = Array(repeating: Array(repeating: "", count: row * 2), count: column * 2)
    
    for y in 0..<column {
        for x in 0..<row {
            resultCard[y][x] = card[y][x]
            resultCard[y][(row*2-1) - x] = card[y][x]
        }
        
        for x in 0..<row {
            resultCard[(column*2-1) - y][x] = card[y][x]
            resultCard[(column*2-1) - y][(row*2-1) - x] = card[y][x]
        }
    }
    
    if let inputError = readLine()?.split(separator: " ") {
        let errorColumn = Int(inputError[0])!
        let errorRow = Int(inputError[1])!
        
        if resultCard[errorColumn-1][errorRow-1] == "." {
            resultCard[errorColumn-1][errorRow-1] = "#"
        } else {
            resultCard[errorColumn-1][errorRow-1] = "."
        }
        
        for y in 0..<column*2 {
            let result = resultCard[y].joined()
            print(result)
        }
    }
}