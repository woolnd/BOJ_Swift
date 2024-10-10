import Foundation

let input = Int(readLine()!)!

for index in 1...input {
    let sum = digitsSum(num: index)
    let result = sum + index
    
    if input == result {
        print(index)
        break
    }
    
    if index == input {
        print(0)
        break
    }
}

func digitsSum(num: Int) -> Int {
    return String(num).map{ String($0)}.reduce(0){ $0 + Int($1)! }
}