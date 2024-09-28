import Foundation

if let count = Int(readLine()!) {
    if count <= 50 {
        subCmd(count: count)
    } else {
        print("50개 이하로 작성해주시길 바랍니다")
    }
}


func subCmd(count: Int) {
    var cmdArray: [[String]] = Array(repeating: [], count: count)

    
    for index in 0..<count {
        if let cmd = readLine() {
            cmdArray[index] = cmd.map { String($0) }
            
            if (index > 0) && (cmdArray[index - 1].count != cmdArray[index].count) {
                exit(0)
            }
        }
    }

    var subCmd: [[Int]] = Array(repeating: [], count: count)

    for index in 0..<cmdArray[0].count {
        for cmdIndex in 0..<cmdArray.count {
            if cmdArray.count == cmdIndex + 1 {
                break
            } else {
                if cmdArray[cmdIndex][index] != cmdArray[cmdIndex + 1][index] {
                    cmdArray[0][index] = "?"
                }
            }
        }
    }

    var result = cmdArray.map { $0.joined() }

    print(result[0])
}