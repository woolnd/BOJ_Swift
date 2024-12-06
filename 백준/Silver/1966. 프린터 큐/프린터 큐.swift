import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    for _ in 0..<inputNumber {
        if let document = readLine()?.split(separator: " "){
            
            let count = Int(document[0]) ?? 0
            let chk = Int(document[1]) ?? 0
            
            var queue = Array(0..<count)
            var result = 0

            
            if let importance = readLine()?.split(separator: " ") {
                var importanceInt = importance.compactMap{ Int($0) }
                
                while true {
                    
                    if importanceInt.first == importanceInt.max() {
                        result += 1
                        if queue.first == chk {
                            break
                        }
                        queue.removeFirst()
                        importanceInt.removeFirst()
                        
                    } else {
                        queue.append(queue.removeFirst())
                        importanceInt.append(importanceInt.removeFirst())
                    }
                }
                
                print(result)
            }
        }
    }
}