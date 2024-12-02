import Foundation

if let input = readLine() {
    let inputNum = Int(input) ?? 0
    
    var count = (1 << inputNum) - 1
    print(count)
    
    hanoi(inputNum, 1, 3, 2)
}

func hanoi(_ disk: Int, _ start: Int, _ end: Int, _ sub: Int){
    if disk == 1{
        print("\(start) \(end)")
    } else {
        hanoi(disk - 1, start, sub, end)

        print("\(start) \(end)")
        
        hanoi(disk - 1, sub, end, start)
    }
}