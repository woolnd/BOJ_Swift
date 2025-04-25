
typealias Point = (r: Int, c: Int)

let N = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func isInRange(_ p: Point, _ d1: Int, _ d2: Int) -> Bool {
    return p.r + d1 + d2 < N &&
           p.c - d1 >= 0 &&
           p.c + d2 < N
}

func calc(_ p: Point, _ d1: Int, _ d2: Int) -> Int {
    var population = [Int](repeating: 0, count: 5)

    for r in 0..<N {
        for c in 0..<N {
            if r < p.r + d1 && c <= p.c && !(r >= p.r && c >= p.c - (r - p.r)) {
                population[0] += map[r][c]
            } else if r <= p.r + d2 && c > p.c && !(r >= p.r && c <= p.c + (r - p.r)) {
                population[1] += map[r][c]
            } else if r >= p.r + d1 && c < p.c - d1 + d2 && !(r <= p.r + d1 + d2 && c >= (p.c - d1 + d2) - (p.r + d1 + d2 - r)) {
                population[2] += map[r][c]
            } else if r > p.r + d2 && c >= p.c - d1 + d2 && !(r <= p.r + d1 + d2 && c <= (p.c - d1 + d2) + (p.r + d1 + d2 - r)) {
                population[3] += map[r][c]
            } else {
                population[4] += map[r][c]
            }
        }
    }

    return population.max()! - population.min()!
}

var result = Int.max

for r in 0..<N {
    for c in 0..<N {
        for d1 in 1..<N {
            for d2 in 1..<N {
                let start = (r, c)
                if isInRange(start, d1, d2) {
                    result = min(result, calc(start, d1, d2))
                }
            }
        }
    }
}

print(result)