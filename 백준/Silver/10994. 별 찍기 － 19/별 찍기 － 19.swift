import Foundation

if let input = readLine() {
    var inputNumber = Int(input) ?? 0
    var length = (4 * inputNumber) - 3
    
    var array: [[Character]] = Array(repeating: Array(repeating: " ", count: length), count: length)
    var x = 0
    var y = 0
    var n = inputNumber
    
    while true {
        
        var line = (4 * n) - 3
        
        if line == 1{
            array[x][y] = "*"
            
            break
        } else {
            for index in 0..<line {
                array[x][y + index] = "*" //윗변
                array[x + index][y] = "*" //좌측
                array[x + (line - 1)][y + index] = "*" //아랫변
                array[x + index][y + (line - 1)] = "*" //우측
                
            }
            n -= 1
            x += 2
            y += 2
        }
    }
    
    for index in 0..<length {
        let result = array[index].compactMap { String($0) }
        
        print(result.joined())
    }
}