import UIKit

var str = "Hello, playground"





// Main: LinkedList

class LinkedNode:Equatable, Hashable{
   
    
    var data:Int?
    var next:LinkedNode?
    
    init(value:Int) {
        self.data = value
        self.next = nil
    }
    
    static func == (lhs: LinkedNode, rhs: LinkedNode) -> Bool {
        return lhs.data == rhs.data && lhs.next == rhs.next
    }
    
    static func !=(lhs:LinkedNode, rhs:LinkedNode) -> Bool {
        return lhs.data != rhs.data && lhs.next != rhs.next
    }
    
    var hashValue: Int {
        return data.hashValue ^ next.hashValue
    }
}


class LinkedList {
    var head:LinkedNode?
    var tail:LinkedNode?
    
    func printTraversal()  {
        print("")
        var n = head
        
        while n != nil {
            print((n?.data)!, separator: " ", terminator: " ")
            n = n?.next
        }
    }
    
    func printTraversal(node:LinkedNode)  {
        print("")
        var n = node
        
        while n != nil {
            print((n.data)!, separator: " ", terminator: " ")
            n = n.next!
        }
    }
    
    func push(node:LinkedNode) {
        node.next = head
        head = node
        printTraversal()
    }
    
    
    func insertAfter(prev:LinkedNode, node:LinkedNode)  {
        if prev == nil {
            print("prev node is nil")
        }
        
        node.next = prev.next
        prev.next = node
        printTraversal()
    }
    
    func insertBefore(next:LinkedNode, node:LinkedNode) {
        var n = head
        var prev:LinkedNode?
        while n! != next {
            prev = n
            n =  n?.next
        }
        
        prev?.next = node
        node.next = next
        printTraversal()
    }
    
    func append(node:LinkedNode) {
//        var n = head
        
//        O(n)
//        while n != nil {
//            n = n?.next
//
//        }
//        n?.next = node
//        node.next = nil
        
//        O(1)
        tail?.next = node
        node.next = nil
        tail = node
        
      
    }
    
    
    func deleteFirst()  {
            head = head?.next
            printTraversal()
    }
    
    func deleteLast()  {
        var n = head
        var prev:LinkedNode?
        while n != nil {
            if n?.next != nil {
            prev = n
            }
            n = n?.next

        }
        prev?.next = n?.next
    }
    
    func deleteKey(key:Int)  {
        var n = head
        var prev:LinkedNode?
        while n != nil && n?.data != key {
                prev = n
                n = n?.next
        }
        
        if n == nil {
            return
        }
        
        prev?.next = n?.next
        
    }
    
    func length() -> Int {
        var n = head
        var count = 0
        while n != nil {
            count+=1
            n = n?.next
        }
        print("Length is ", count)
        return count
    }
    
    func search(key: Int)  {
        var n = head
        var count = 0
        while n != nil && n?.data != key {
            count+=1
            n = n?.next
        }
        
        print("Key found at location ", count)
    }
    
    func search(position:Int)  {
        var n = head
        var count = 0
        
        for i in 0...position-1{
            n = n?.next
        }
        
        print("Key at position ", position, " is ",(n?.data)!)
    }
    
    
    func lastNthNode(position:Int) {
        //Method 1
//        var n = head
//        var length = self.length()
//
//        for i in 1..<(length-position+1){
//            n = n?.next
//        }
//
//        print("Key at position ", position, "from last is ", (n?.data)!)

        //Method 2
        
        var main = head
        var ref = head
        var count = 0
        while ref != nil &&  count < position{
            count += 1
            ref = ref?.next
        }
        
        while ref != nil {
            main = main?.next
            ref = ref?.next
        }
        
        print("Item at position ", position, " from last is ", (main?.data)!)
        
    }
    
    
    func middleElement() {
        //Method 1
//        var n = head
//        var length = self.length()
//
//        for i in 1..<(length/2+1) {
//            n = n?.next
//        }
//
//        print("Value at middle is ", (n?.data)!)
        
        
        //Method 2
      
        var main = head
        var ref = head
        var count = 1
        var length = self.length()
        while ref != nil && count < length/2+1 {
            count+=1
            ref = ref?.next
            
        }
        
        while ref != nil {
            ref = ref?.next
            main = main?.next
        }
        
        print("The middle element is ", (main?.data)!)
    }
    
    
    func elementCount(value:Int) {
        var n = head
        var count = 0
        while  n != nil {
            if (n?.data)! == value {
                count+=1
            }
            n = n?.next
        }
        
        print("Count of element ", value, " in linked list is ", count)
    }
    
//    @discardableResult
//    func detectLoop() -> Bool {
//        var n = head
//        var visitedNode = Set<LinkedNode>()
//        while n != nil {
//            print(n!.data, " ", visitedNode.contains(n!))
//            if visitedNode.contains(n!){
//                print(n!)
//                print("Loop present")
//                return true
//            } else {
//                visitedNode.insert(n!)
//                n = n?.next
//            }
//        }
//
//        print("Loop is not present")
//        return false
//    }

    func removeDuplicateSorted(){
     // Check if next element is same as prev
        var n = head
        var next_next:LinkedNode!
        while n!.next != nil  {
            if n!.data == n!.next!.data {
                next_next = n!.next!.next
                n!.next = nil
                n!.next = next_next
            } else {
                n = n!.next
            }
        }
    }
    
    func removeDuplicatedUnsorted() {
        //Method !: Two loops.. check each element one by one O(n2)
        //Method 2: Use sorting.. sort the linkedlist using mergesort and check for the
        //duplicate elements next by next
        //Method 3: Use hashing: store the visited node if it does not contain
        // in the hash map, if it exists delete the node
        var prev, curr:LinkedNode!
        curr = head
        prev = nil
        var map = [Int]()
        while curr != nil {
            var curVal = (curr.data)!
            if map.contains(curVal){
               prev.next = curr.next
            } else {
                map.append(curVal)
                prev = curr
            }
            curr = curr.next
        }
    }
    
    func swapTwoNodesNotData(x:Int, y:Int)  {
        var n = head
        var prevX, currX, prevY, currY:LinkedNode!
        
        if x==y {
            return
        }
        prevX = nil
        currX = head
        while currX != nil && currX.data != x {
            prevX = currX
            currX = currX.next
        }
        
        prevY = nil
        currY = head
        while currY != nil && currY.data != y {
            prevY = currY
            currY = currY.next
        }
        
        if 
        
    }
        
    }



var linkedList = LinkedList()
linkedList.head = LinkedNode(value: 5)
var one  = LinkedNode(value: 3)
var two  = LinkedNode(value: 4)
var three  = LinkedNode(value: 3)
var four  = LinkedNode(value: 8)


linkedList.head?.next = one
one.next = two
two.next = three
three.next = four
linkedList.tail = four

exampleOf(description: "Node Traversal") {
    linkedList.printTraversal()
}

exampleOf(description: "Push") {
    linkedList.push(node: LinkedNode(value: 2))
}

exampleOf(description: "InsertAfter") {
    linkedList.insertAfter(prev: one, node: LinkedNode(value: 6))
}

exampleOf(description: "Insert Before") {
    linkedList.insertBefore(next: three, node: LinkedNode(value: -9))
}

exampleOf(description: "Append") {
    linkedList.append(node: LinkedNode(value: 10))
    linkedList.printTraversal()
}

exampleOf(description: "Another append") {
    linkedList.append(node: LinkedNode(value: 11))
    linkedList.printTraversal()
}

exampleOf(description: "Delete first") {
    linkedList.deleteFirst()
}


exampleOf(description: "Delete Last") {
    linkedList.deleteLast()
    linkedList.printTraversal()
}


exampleOf(description: "Delete key") {
    linkedList.deleteKey(key: -9)
    linkedList.printTraversal()
}

exampleOf(description: "Length of Linked List") {
    linkedList.length()
}


exampleOf(description: "Search Key") {
    linkedList.search(key: 8)
}

exampleOf(description: "Search Position") {
    linkedList.search(position: 3)
}

exampleOf(description: "nth node from last") {
    linkedList.lastNthNode(position: 2)
}


exampleOf(description: "Middle Element") {
    linkedList.middleElement()
}


exampleOf(description: "Count the occurence") {
    linkedList.elementCount(value: 5)
}
exampleOf(description: "Delete duplicate occurence in sorted linked list") {
    linkedList.printTraversal()
    linkedList.removeDuplicateSorted()
    linkedList.printTraversal()
}

exampleOf(description: "Delete duplicate occurence in unsorted list") {
    linkedList.push(node: LinkedNode(value: 3))
    linkedList.printTraversal()
    linkedList.removeDuplicatedUnsorted()
    linkedList.printTraversal()
}
