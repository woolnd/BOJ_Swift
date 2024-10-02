import Foundation

if let input = readLine()?.split(separator: " ") {
    let N = Int(input[0])
    let M = Int(input[1])
    
    if let inputCard = readLine()?.split(separator: " "), inputCard.count <= N! {
        let inputCardInt = inputCard.map{ Int($0) }
        
        var sum: [Int] = []
        
        for x in 0..<inputCardInt.count - 2 {
            for y in x+1..<inputCardInt.count - 1 {
                for z in y+1..<inputCardInt.count {
                    if x != y, x != z, y != z {
                        sum.append(inputCardInt[x]! + inputCardInt[y]! + inputCardInt[z]!)
                    }
                }
            }
        }
        
        let result = sum.filter{ $0 <= M!}
        print(result.max()!)
    }
}