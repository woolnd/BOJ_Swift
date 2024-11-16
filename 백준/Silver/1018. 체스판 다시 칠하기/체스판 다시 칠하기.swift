import Foundation

if let input = readLine()?.split(separator: " "){
    let inputN = Int(input[0])!
    let inputM = Int(input[1])!
    
    let startWhite: [[Character]] = [["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"]]

    let startBlack: [[Character]] = [["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"],
                                     ["B","W","B","W","B","W","B","W"],
                                     ["W","B","W","B","W","B","W","B"]]
    
    var chessboard = [[Character]]()

    for _ in 0..<inputN {
      let y = readLine()!
      chessboard.append(Array(y))
    }

    var result = Int.max

    for y in 0...(inputN - 8)  {
      for x in 0...(inputM - 8) {
        var count1 = 0, count2 = 0
        for i in y..<(y + 8) {
          for j in x..<(x + 8) {
            if chessboard[i][j] != startWhite[i - y][j - x] {
              count1 += 1
            }
            if chessboard[i][j] != startBlack[i - y][j - x] {
              count2 += 1
            }
          }
        }
        result = min(result, count1, count2)
      }
    }

    print(result)

}