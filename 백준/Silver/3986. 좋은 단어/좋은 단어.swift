import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var count = 0
    
    for _ in 0..<inputNumber {
        var stack: [Character] = []
        var word = readLine() ?? ""
        
        for char in word {
            if char == "A" {
                if stack.last == "A" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            } else if char == "B"{
                if stack.last == "B"{
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
        
        if stack.isEmpty {
            count += 1
        }
    }
    
    print(count)
}
