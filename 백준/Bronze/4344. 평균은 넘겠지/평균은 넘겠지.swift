import Foundation

var avgOver: [Double] = []
var caseNumber: Int = Int(readLine()!)!

for _ in 0..<caseNumber {
    var scoreSum: Int = 0
    if let studentNumber = readLine() {
        let studentArray = studentNumber.split(separator: " ").compactMap { Int($0) }
        
        if let count = studentArray.first {
            
            for indexNum in 1...count {
                scoreSum += studentArray[indexNum]
            }
            let avg = Double(scoreSum / count)
            
            var avgOverCount: Int = 0
            
            for indexNum in 1...count {
                if Double(studentArray[indexNum]) > avg {
                    avgOverCount += 1
                }
            }
            
            var over: Double = (Double(avgOverCount) / Double(count)) * 100
            avgOver.append(over)
        }
    }
}

for avg in 0..<caseNumber {
    print("\(String(format: "%.3f", avgOver[avg]))%")
}