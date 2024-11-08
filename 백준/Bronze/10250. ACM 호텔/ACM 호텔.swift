import Foundation

var input = Int(readLine() ?? "")
var result: [Int] = []

while input! > 0 {
    if let hotel = readLine()?.split(separator: " "), hotel.count == 3{
        var roomData: [Int] = []
        let intData = hotel.compactMap { Int($0) }
        
        let lastRoom = (intData[0] * 100) + intData[1]
        
    outSide: for w in 1 ... intData[1] {
            for h in 1 ... intData[0] {
                if roomData.count != intData[2] {
                    roomData.append((h * 100) + w)
                } else {
                    break outSide
                }
            }
        }
        result.append(roomData.last!)
    }
    input! -= 1
}

for index in result {
    print(index)
}
