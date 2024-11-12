import Foundation

if let input = readLine(){
    var inputNumber = Int(input)!
    
    var result: [Int] = []
    
    while inputNumber != 0{
        
        var numberOfPeople: [[Int]] = Array(repeating: Array(repeating: 0, count: 15), count: 15)
        
        let inputK = Int(readLine()!)!
        let inputN = Int(readLine()!)!
        
        for indexK in 0...inputK {
            for indexN in 1...inputN {
                
                if indexK == 0{
                    numberOfPeople[indexK][indexN] = indexN
                } else {
                    for beforeN in 1...indexN {
                        numberOfPeople[indexK][indexN] += numberOfPeople[indexK - 1][beforeN]
                    }
                }
            }
        }
        result.append(numberOfPeople[inputK][inputN])
        
        inputNumber -= 1
    }
    
    for index in 0..<result.count {
        print(result[index])
    }
}