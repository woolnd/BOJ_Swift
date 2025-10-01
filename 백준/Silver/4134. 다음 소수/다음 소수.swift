import Foundation

// √(4e9)까지 체
let LIMIT: Int = 63245
var isComposite = Array(repeating: false, count: LIMIT + 1)
var primes: [Int] = []

for i in 2...LIMIT {
    if !isComposite[i] {
        primes.append(i)
        if i * i <= LIMIT {                 // 오버플로X
            var j = i * i
            while j <= LIMIT {
                isComposite[j] = true
                j += i
            }
        }
    }
}

// x가 소수인지 판정 (모든 비교/연산을 Int64로 통일)
func isPrime(_ x: Int64) -> Bool {
    if x < 2 { return false }
    for p in primes {
        let pp = Int64(p)
        if pp > x / pp { break }            // pp*pp > x (곱 대신 나눗셈으로 안전 비교)
        if x % pp == 0 { return false }     // 양쪽 모두 Int64
    }
    return true
}

// 입력
guard let tLine = readLine(), let t = Int(tLine) else { exit(0) }
for _ in 0..<t {
    guard let nLine = readLine(), let nInt64 = Int64(nLine) else { exit(0) }
    var m: Int64 = max(nInt64, Int64(2))   // 제네릭 추론 이슈 방지
    while !isPrime(m) { m += 1 }
    print(m)
}