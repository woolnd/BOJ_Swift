import Foundation

var height: [Int] = []
var sum: [Int] = []

for _ in 0..<9 {
    if let input = Int(readLine()!), input <= 100 {
        height.append(input)
    }
}


while true {
    height.shuffle()
    
    var result = 0
    
    for index in 0..<7 {
        let number = height[index]
        sum.append(number)
        result += number
    }
    
    if result == 100 {
        break
    }
    
    sum.removeAll()
}

sum.sort()
for index in 0..<7 {
    print(sum[index])
}