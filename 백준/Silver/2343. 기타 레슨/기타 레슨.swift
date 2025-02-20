if let input = readLine()?.split(separator: " "), input.count == 2{
    let N = Int(input[0]) ?? 0
    let M = Int(input[1]) ?? 0
    
    if let inputLecture = readLine()?.split(separator: " "), inputLecture.count == N {
        let lectures = inputLecture.compactMap{ Int($0) }
        
        var start = lectures.max()!
        var end = lectures.reduce(0, +)
        var result = 0
        
        while start <= end {
            let mid = (start + end) / 2
            var count = 1
            var total = 0
            
            for lecture in lectures {
                if total + lecture > mid{
                    total = lecture
                    count += 1
                } else {
                    total += lecture
                }
            }
            
            if count <= M{
                result = mid
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        print(result)
    }
}