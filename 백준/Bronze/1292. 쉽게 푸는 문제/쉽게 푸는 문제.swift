import Foundation

if let input = readLine()?.split(separator: " "){
    let inputA = Int(input[0]) ?? 0
    let inputB = Int(input[1]) ?? 0
    
    var result: [Int] = [0]
    var sum = 0
    
    for index in 1...inputB {
        for _ in 1...index {
            sum += index
            result.append(sum)
        }
    }
    sum = result[inputB] - result[inputA - 1]
    
    print(sum)
}