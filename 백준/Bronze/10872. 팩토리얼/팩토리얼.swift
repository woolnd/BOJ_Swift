import Foundation

if let input = readLine(){
    let inputNumber = Int(input)!
    
    var result = 1
    
    if inputNumber == 0{
        result = 1
    } else {
        for index in 1...inputNumber {
            result *= index
        }
    }
    
    print(result)
}