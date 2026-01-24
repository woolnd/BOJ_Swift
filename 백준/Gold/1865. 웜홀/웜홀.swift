
let TC = Int(readLine()!)!

for _ in 0..<TC {
    let NMW = readLine()!.split(separator: " ").map{ Int($0)! }
    let N = NMW[0], M = NMW[1], W = NMW[2]
    
    var edges: [(u: Int, v: Int, w: Int)] = []
    
    for _ in 0..<M {
        let roadSET = readLine()!.split(separator: " ").map{ Int($0)! }
        let S = roadSET[0], E = roadSET[1], T = roadSET[2]
        edges.append((S, E, T))
        edges.append((E, S, T))
    }
    
    for _ in 0..<W {
        let holeSET = readLine()!.split(separator: " ").map{ Int($0)! }
        let S = holeSET[0], E = holeSET[1], T = holeSET[2]
        edges.append((S, E, -T))
    }
    
    var dist = Array(repeating: 0, count: N + 1)
    var negativeFlag = false
    
    for i in 1...N {
        for (u, v, w) in edges {
            if dist[v] > dist[u] + w {
                dist[v] = dist[u] + w
                
                if i == N {
                    negativeFlag = true
                    break
                }
            }
        }
    }
    
    if negativeFlag {
        print("YES")
    } else {
        print("NO")
    }
}
