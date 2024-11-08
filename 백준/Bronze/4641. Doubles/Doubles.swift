import Foundation

var result: [Int] = []

while true {
    if let input = readLine()?.split(separator: " ") {
        
        // -1 하나만 입력됐을 때 종료
        if input.count == 1 && input[0] == "-1" {
            for number in result {
                print(number)
            }
            break
        }
        
        // 입력의 길이가 2 이상 15 이하이고 마지막 값이 0인 경우만 처리
        if input.count >= 2 && input.count <= 16 && input.last == "0" {
            let inputNumber = input.dropLast().compactMap { Int($0) } // 마지막 0 제외
            
            var count = 0
            
            for number in inputNumber {
                if inputNumber.contains(number * 2){
                    count += 1
                }
            }
            result.append(count)
        }
    }
}