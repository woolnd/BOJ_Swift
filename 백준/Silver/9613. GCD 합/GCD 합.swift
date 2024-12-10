import Foundation

if let inputCase = readLine() {
    let caseNumber = Int(inputCase) ?? 0
    
    for _ in 0..<caseNumber{
        var sum = 0
        
        if let input = readLine()?.split(separator: " "){
            let inputNumber = input.compactMap{ Int($0) }
            
            if inputNumber[0] == inputNumber.count - 1 {
                for i in 1..<inputNumber.count {
                    for j in i + 1..<inputNumber.count {
                        sum += GCD(inputA: inputNumber[i], inputB: inputNumber[j])
                    }
                }
            }
            
            print(sum)
        }
    }
    
}

func GCD(inputA: Int, inputB: Int) -> Int {
    var A = inputA
    var B = inputB
    
    while B != 0{
        let remainder: Int = A % B
        A = B
        B = remainder
    }
    
    return A
}