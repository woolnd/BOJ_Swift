import Foundation

final class FastScanner {
    private var data:[UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var idx: Int = 0

    func readInt() -> Int {
        while data[idx] == 10 || data[idx] == 13 || data[idx] == 32 { idx += 1 }
        var sign = 1
        if data[idx] == 45 { sign = -1; idx += 1 }
        var num = 0
        while data[idx] >= 48 {
            num = num * 10 + Int(data[idx] - 48)
            idx += 1
        }
        return num * sign
    }

    func readLineBytes(_ count: Int) -> [UInt8] {
        while data[idx] == 10 || data[idx] == 13 { idx += 1 }
        let start = idx
        idx += count
        return Array(data[start..<start+count])
    }
}

let scanner = FastScanner()
let R = scanner.readInt()
let C = scanner.readInt()

var board = Array(repeating: [UInt8](), count: R)
for i in 0..<R {
    board[i] = scanner.readLineBytes(C)   // 'A'~'Z' ASCII
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var answer = 0

@inline(__always)
func dfs(_ y: Int, _ x: Int, _ mask: Int, _ depth: Int) {
    if depth > answer { answer = depth }
    if answer == 26 { return }

    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        if ny < 0 || ny >= R || nx < 0 || nx >= C { continue }

        let bit = 1 << Int(board[ny][nx] - 65) // 65 = 'A'
        if (mask & bit) != 0 { continue }

        dfs(ny, nx, mask | bit, depth + 1)
    }
}

let startBit = 1 << Int(board[0][0] - 65)
dfs(0, 0, startBit, 1)
print(answer)