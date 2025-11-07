import Foundation

struct FastScanner {
    private var data: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var idx: Int = 0
    mutating func readInt() -> Int {
        var sign = 1, num = 0
        while data[idx] == 10 || data[idx] == 13 || data[idx] == 32 { idx += 1 } // skip spaces
        if data[idx] == 45 { sign = -1; idx += 1 } // minus
        while data[idx] >= 48 {
            num = num * 10 + Int(data[idx] - 48)
            idx += 1
        }
        return num * sign
    }
}

var scan = FastScanner()
let N = scan.readInt()
let M = scan.readInt()

var prefix = [Int](repeating: 0, count: N + 1)
for i in 1...N {
    prefix[i] = prefix[i - 1] + scan.readInt()
}

var out = String()
for _ in 0..<M {
    let i = scan.readInt()
    let j = scan.readInt()
    out += "\(prefix[j] - prefix[i - 1])\n"
}
print(out, terminator: "")