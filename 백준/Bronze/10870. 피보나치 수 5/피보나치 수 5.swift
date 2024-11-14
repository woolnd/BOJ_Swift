import Foundation

if let input = readLine() {
    
    if let inputNumber = Int(input), inputNumber <= 20, inputNumber >= 0 {
        var result: [Int] = []
        result.append(0)
        result.append(1)
        
        if inputNumber >= 2{
            for index in 2...inputNumber{
                
                var sum = result[index - 2] + result[index - 1]
                result.append(sum)
            }
        }
        
        print(result[inputNumber])
    }
}