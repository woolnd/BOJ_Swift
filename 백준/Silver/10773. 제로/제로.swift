import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var result: [Int] = []
    
    for _ in  0..<inputNumber {
        let number = Int(readLine() ?? "0")
        
        if number != 0 {
            result.append(number ?? 0)
        } else if number == 0{
            result.removeLast()
        }
    }
    
    var sum = 0
    result.compactMap { num in
        sum += num
    }
    
    print(sum)
}