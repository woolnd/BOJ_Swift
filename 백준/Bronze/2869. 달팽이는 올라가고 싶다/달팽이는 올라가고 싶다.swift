import Foundation

if let input = readLine()?.split(separator: " "), input.count == 3{
    
    let inputNumber = input.compactMap{ Int($0) }
    
    let A = inputNumber[0]
    let B = inputNumber[1]
    let V = inputNumber[2]
    
    let day = (V - B + (A - B - 1)) / (A - B)

    print(day)
}