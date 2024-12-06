import Foundation

if let input = readLine() {
    let inputNumber = Int(input) ?? 0
    
    var deque: [Int] = []
    
    for _ in 0..<inputNumber {
        if let command = readLine()?.split(separator: " "){
            let commandString = command[0]
            let data = command.count > 1 ? Int(command[1]) : nil
            
            switch commandString {
            case "push_front":
                push_front(data: data ?? 0, deque: &deque)
            case "push_back":
                push_back(data: data ?? 0, deque: &deque)
            case "pop_front":
                pop_front(deque: &deque)
            case "pop_back":
                pop_back(deque: &deque)
            case "size":
                size(deque: &deque)
            case "empty":
                empty(deque: &deque)
            case "front":
                front(deque: &deque)
            case "back":
                back(deque: &deque)
            default:
                break
            }
            
        }
    }
}

func push_front(data: Int, deque: inout [Int]){
    deque.reverse()
    deque.append(data)
    deque.reverse()
}

func push_back(data: Int, deque: inout [Int]){
    deque.append(data)
}

func pop_front(deque: inout [Int]){
    if !deque.isEmpty {
        let pop = deque.removeFirst()
        print(pop)
    } else {
        print("-1")
    }
}

func pop_back(deque: inout [Int]){
    if !deque.isEmpty {
        let pop = deque.removeLast()
        print(pop)
    } else {
        print("-1")
    }
}

func size(deque: inout [Int]){
    print(deque.count)
}

func empty(deque: inout [Int]){
    if deque.isEmpty{
        print("1")
    } else {
        print("0")
    }
}

func front(deque: inout [Int]){
    if !deque.isEmpty{
        print(deque.first ?? 0)
    } else {
        print("-1")
    }
}

func back(deque: inout [Int]){
    if !deque.isEmpty{
        print(deque.last ?? 0)
    } else {
        print("-1")
    }
}