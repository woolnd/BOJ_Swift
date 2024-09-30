import Foundation

if let input = readLine()?.split(separator: " ") {
    let n = Int(input[0])!
    let x = Int(input[1])!
    var array: [Int] = []
    if inputCheck(input: n) && inputCheck(input: x) {
        if let inputNumber = readLine()?.split(separator: " "), inputNumber.count <= n {
            for index in 0..<n {
                if inputCheck(input: Int(inputNumber[index])!) {
                    array.append(Int(inputNumber[index])!)
                } else {
                    print("input 값이 1에서 10,000사이에 해당하지 않습니다.")
                    exit(0)
                }
            }
        }
    } else {
        print("input 값이 1에서 10,000사이에 해당하지 않습니다.")
        exit(0)
    }
    
    let filter = array.filter { $0 < x }
    let filterString = filter.map{ String($0) }
    let result = filterString.joined(separator: " ")
    print(result)
}


func inputCheck(input: Int) -> Bool{
    if (input >= 1 && input <= 10000) {
        return true
    } else {
        return false
    }
}