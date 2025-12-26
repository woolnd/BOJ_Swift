import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0], M = nm[1]

let truthLine = readLine()!.split(separator: " ").map { Int($0)! }
let tCount = truthLine[0]
let truthPeople: [Int] = tCount > 0 ? Array(truthLine[1...tCount]) : []

var parent = Array(0...N)

func find(_ x: Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let ra = find(a), rb = find(b)
    if ra != rb { parent[rb] = ra }
}

var parties: [[Int]] = []
parties.reserveCapacity(M)

for _ in 0..<M {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let k = arr[0]
    let members = k > 0 ? Array(arr[1...k]) : []
    parties.append(members)

    if members.count >= 2 {
        let first = members[0]
        for i in 1..<members.count {
            union(first, members[i])
        }
    }
}

var truthRoots = Set<Int>()
for p in truthPeople {
    truthRoots.insert(find(p))
}

var answer = 0
for members in parties {
    var canLie = true
    for p in members {
        if truthRoots.contains(find(p)) {
            canLie = false
            break
        }
    }
    if canLie { answer += 1 }
}

print(answer)