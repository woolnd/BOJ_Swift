import Foundation

if let input = readLine()?.split(separator: " ") {
    let numberA = Int(input[0])!
    let numberB = Int(input[1])!
    
    if numberA > numberB {
        print(">")
    } else if numberA < numberB {
        print("<")
    } else {
        print("==")
    }
}