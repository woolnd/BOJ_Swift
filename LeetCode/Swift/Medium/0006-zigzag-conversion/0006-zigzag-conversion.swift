class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || s.count <= numRows {
            return s
        }

        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var isGoingDown = false

        for c in s {
            rows[currentRow].append(c)

            if currentRow == 0 || currentRow == numRows - 1 {
                isGoingDown = !isGoingDown
            }

            currentRow += isGoingDown ? 1 : -1
        }

        return rows.joined()
    }
}