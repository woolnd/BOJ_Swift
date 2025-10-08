import Foundation

final class FastScanner {
    private var data: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var idx: Int = 0
    @inline(__always) private func skipSpaces() {
        while data[idx] == 10 || data[idx] == 13 || data[idx] == 32 || data[idx] == 9 { idx += 1 } // \n \r ' ' \t
    }
    @inline(__always) func readInt() -> Int {
        skipSpaces()
        var sign = 1, num = 0
        if data[idx] == 45 { sign = -1; idx += 1 }
        while data[idx] >= 48 {
            num = num * 10 + Int(data[idx] - 48)
            idx += 1
        }
        return num * sign
    }
}

let sc = FastScanner()
let N = sc.readInt()

var cur = [UInt8](repeating: 0, count: N) // 현재 상태(처음엔 모두 0)
var cnt = 0

for i in 0..<N {
    let target = UInt8(sc.readInt()) // 0 또는 1
    if cur[i] != target {
        cnt += 1
        cur[i] ^= 1
        if i + 1 < N { cur[i + 1] ^= 1 }
        if i + 2 < N { cur[i + 2] ^= 1 }
    }
}

print(cnt)
