import Foundation

if let input = readLine()?.split(separator: " "){
    let inputE = Int(input[0])!
    let inputS = Int(input[1])!
    let inputM = Int(input[2])!
    
    var year = inputE
    while true {
        if (year - inputS) % 28 == 0 && (year - inputM) % 19 == 0{
            break
        }
        year += 15
    }
    print(year)
}