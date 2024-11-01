import Foundation

let AdrianAnswer = ["A", "B", "C"]
let AdrianArray = (0..<100).map { AdrianAnswer[$0 % AdrianAnswer.count] }

let BrunoAnswer = ["B", "A", "B", "C"]
let BrunoArray = (0..<100).map { BrunoAnswer[$0 % BrunoAnswer.count] }

let GoranAnswer = ["C", "C", "A", "A", "B", "B"]
let GoranArray = (0..<100).map { GoranAnswer[$0 % GoranAnswer.count] }

var Count = [0, 0, 0]

if let count = readLine() {
    let answer = readLine()!
    
    if Int(count) == answer.count {
        let characters = Array(answer)
        
        for index in 0..<characters.count {
            if String(characters[index]) == AdrianArray[index] {
                Count[0] += 1
            }
            
            if String(characters[index]) == BrunoArray[index] {
                Count[1] += 1
            }
            
            if String(characters[index]) == GoranArray[index] {
                Count[2] += 1
            }
        }
        
        let maxScore = Count.max()!
        print(maxScore)
        
        if Count[0] == maxScore {
            print("Adrian")
        }
        if Count[1] == maxScore {
            print("Bruno")
        }
        if Count[2] == maxScore {
            print("Goran")
        }
    }
}