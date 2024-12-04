import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    for _ in 0..<inputNumber {
        if let inputVPS = readLine() {
            VPS(input: inputVPS)
        }
    }
}


func VPS(input: String) {
    var stack: [Character] = []
    
    for char in input {
        if char == "(" {
            stack.append(char)
        } else if char == ")"{
            if stack.isEmpty{
                print("NO")
                return
            }
            
            stack.removeLast()
        }
    }
    
    print(stack.isEmpty ? "YES" : "NO")
}
