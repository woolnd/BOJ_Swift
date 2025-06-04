import Foundation

final class FileIO {
    private var buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = .standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)] // null termination
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var number = 0
        var isNegative = false
        var byte = read()

        while byte == 10 || byte == 32 { byte = read() } // skip space and newline

        if byte == 45 { isNegative = true; byte = read() } // '-'

        while byte >= 48 && byte <= 57 {
            number = number * 10 + Int(byte - 48)
            byte = read()
        }

        return number * (isNegative ? -1 : 1)
    }
}

let file = FileIO()
let n = file.readInt()
var segments = [(Int, Int)]()

for _ in 0..<n {
    let x = file.readInt()
    let y = file.readInt()
    segments.append((x, y))
}

segments.sort { $0.0 < $1.0 }

var answer = 0
var (start, end) = segments[0]

for i in 1..<n {
    let (x, y) = segments[i]
    if x > end {
        answer += end - start
        start = x
        end = y
    } else {
        end = max(end, y)
    }
}

answer += end - start
print(answer)