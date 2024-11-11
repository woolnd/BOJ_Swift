import Foundation

if let input = readLine() {
    let inputNumber = Int(input)!
    
    var line = 0
    
    while true {
        if (line - 1) * line / 2 < inputNumber, inputNumber <= line * (line + 1) / 2{
            break
        }
        line += 1
    }
    
    let allNumber = line * (line + 1) / 2
    
    if line % 2 != 0{ //홀수
        let molecule = (allNumber - inputNumber) + 1
        let denominator = line - (allNumber - inputNumber)
        
        print("\(molecule)/\(denominator)")
    } else { //짝수
        let molecule = line - (allNumber - inputNumber)
        let denominator = (allNumber - inputNumber) + 1
        
        print("\(molecule)/\(denominator)")
        
    }
}