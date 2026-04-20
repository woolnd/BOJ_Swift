/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var curr = dummy
    var carry = 0
    var p = l1, q = l2

    while p != nil || q != nil || carry != 0 {
        if carry == 0 {
            if p == nil { curr.next = q; break }
            if q == nil { curr.next = p; break }
        }

        let x = p?.val ?? 0
        let y = q?.val ?? 0
        let sum = x + y + carry
        
        carry = sum / 10
        curr.next = ListNode(sum % 10)
        curr = curr.next!

        p = p?.next
        q = q?.next
    }
    return dummy.next
}
}