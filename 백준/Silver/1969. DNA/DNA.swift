import Foundation

if let input = readLine()?.split(separator: " "){
    let inputN = Int(input[0])!
    let inputM = Int(input[1])!
    
    var dna = [[Character]]()
    
    for _ in 0..<inputN {
        if let y = readLine(), y.count == inputM{
            dna.append(Array(y))
        }
    }
    
    var result: [Character] = []
    
    for index in 0..<inputM{
        
        var a_count = 0
        var c_count = 0
        var g_count = 0
        var t_count = 0
        
        for line in 0..<inputN{
            switch dna[line][index]{
            case "A":
                a_count += 1
            case "C":
                c_count += 1
            case "G":
                g_count += 1
            case "T":
                t_count += 1
            default:
                break
            }
        }
        
        // A, C, G, T 중 가장 많이 나온 문자 선택 (사전순으로 처리)
        let counts = [("A", a_count), ("C", c_count), ("G", g_count), ("T", t_count)]
        let mostFrequent = counts.max {
            if $0.1 == $1.1 { // 같은 개수일 경우 사전순으로 비교
                return $0.0 > $1.0
            }
            return $0.1 < $1.1 // 개수 비교
        }?.0 ?? "A" // 기본값으로 "A"
        
        // 결과에 추가
        result.append(Character(mostFrequent))
    }
    
    var hammingDistance = 0
    
    for line in 0..<inputN{
        for index in 0..<inputM {
            if dna[line][index] != result[index]{
                hammingDistance += 1
            }
        }
    }
    
    print(String(result))
    print(hammingDistance)
}
