import Foundation

let monthAray = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let weekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
if let inputDate = readLine()?.split(separator: " ") {

    if let month = Int(inputDate[0]), (month <= 12 && month >= 1){
        if let date = Int(inputDate[1]), (date <= 31 && date >= 1){
            var dateIndex = 0
            
            for index in 0..<month - 1 {
                dateIndex += monthAray[index]
            }
            
            dateIndex += date - 1
            
            let result = (dateIndex+1) % 7
            print(weekArray[result])
            
        } else {
            exit(0)
        }
    } else {
        exit(0)
    }
}