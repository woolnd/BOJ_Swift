import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var queue: [Int] = []
    
    for _ in 0..<inputNumber {
        if let command = readLine()?.split(separator: " "){
            let commandString = command[0]
            let data = command.count > 1 ? Int(command[1]) ?? 0 : nil
            
            switch commandString {
            case "push":
                push(input: data ?? 0, queue: &queue)
            case "pop":
                pop(queue: &queue)
            case "size":
                size(queue: &queue)
            case "empty":
                empty(queue: &queue)
            case "front":
                front(queue: &queue)
            default:
                back(queue: &queue)
            }
            
        }
    }
    
}

func push(input: Int, queue: inout [Int]) {
    queue.append(input)
}

func pop(queue: inout [Int]) {
    if !queue.isEmpty {
        print(queue.first ?? 0)
        queue.removeFirst()
    } else {
        print("-1")
    }
}

func size(queue: inout [Int]) {
    print(queue.count)
}

func empty(queue: inout [Int]) {
    print(queue.isEmpty ? "1" : "0")
}

func front(queue: inout [Int]) {
    if !queue.isEmpty {
        print(queue.first ?? 0)
    } else {
        print("-1")
    }
}

func back(queue: inout [Int]) {
    if !queue.isEmpty {
        print(queue.last ?? 0)
    } else {
        print("-1")
    }
}