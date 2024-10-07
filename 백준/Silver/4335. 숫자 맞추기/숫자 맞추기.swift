import Foundation

var result: [Bool] = []

var high: [Int] = []
var low: [Int] = []

while true {
    let number = Int(readLine()!)!
    if number == 0 {
        break
    } else if number < 1 && number > 10 {
        exit(0)
    }
        
    let response = readLine()!
    var isHonest: Bool
    
    if response == "too high" {
            high.append(number)
        } else if response == "too low" {
            low.append(number)
        } else if response == "right on" {
            isHonest = true
            
            // 숫자가 "too high"라고 했던 숫자보다 크면 거짓말
            for highNum in high {
                if number >= highNum {
                    isHonest = false
                    break
                }
            }
            
            // 숫자가 "too low"라고 했던 숫자보다 작으면 거짓말
            if isHonest {
                for lowNum in low {
                    if number <= lowNum {
                        isHonest = false
                        break
                    }
                }
            }
            
            result.append(isHonest)
            high.removeAll()
            low.removeAll()
        }
}

for index in 0..<result.count {
    if result[index] {
        print("Stan may be honest")
    } else {
        print("Stan is dishonest")
    }
}
