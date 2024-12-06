import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var queue = ArraySlice(1...inputNumber)
    
    while queue.count > 1 {
        queue = queue.dropFirst()
        queue.append(queue.removeFirst())
    }
    
    print(queue.first ?? 0)
}