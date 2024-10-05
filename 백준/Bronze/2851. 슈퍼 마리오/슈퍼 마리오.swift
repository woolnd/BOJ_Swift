import Foundation

var mushroom: [Int] = []

for index in 0..<10 {
    mushroom.append(Int(readLine()!)!)
}

var mushroomIndex = 0
var result = 0

while mushroomIndex < 10 {
    if mushroomIndex == 0 {
        result += mushroom[mushroomIndex]
        mushroomIndex += 1
    } else if mushroomIndex <= 9 {
        let current = result
        let preview = mushroom[mushroomIndex] + result
        
        if preview < 100 {
            result += mushroom[mushroomIndex]
            mushroomIndex += 1
        } else {
            if abs(current - 100) < abs(preview - 100){
                break
            } else if abs(current - 100) == abs(preview - 100){
                result += mushroom[mushroomIndex]
                break
            } else {
                result += mushroom[mushroomIndex]
                mushroomIndex += 1
            }
        }
    }
}

print(result)