import Foundation

let n = Int(readLine() ?? "0") ?? 0
let tree = readLine()?.split(separator: " ").map { Int($0) ?? 0 } ?? []

var sumTree = 0       // 모든 나무의 총 높이 합
var divideTwoTree = 0 // 물뿌리개로 2를 성장시킬 수 있는 횟수
var divideThreeTree = 0 // 3으로 나누는 조건을 확인하기 위한 값

for height in tree {
    sumTree += height
    divideTwoTree += height / 2
}

// 나무의 총 높이를 3으로 나누기
divideThreeTree = sumTree / 3

// 전체 나무 높이가 0이면 이미 조건을 만족
if sumTree == 0 {
    print("YES")
}
// 총 합이 3의 배수가 아니면 조건을 만족할 수 없음
else if sumTree % 3 != 0 {
    print("NO")
}
// 물뿌리개 조건 확인
else {
    if divideTwoTree >= divideThreeTree {
        print("YES")
    } else {
        print("NO")
    }
}