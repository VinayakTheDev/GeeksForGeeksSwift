import UIKit

var str = "Hello, playground"


//var arrOddSum = [10, 20, 30, 40, 40]
//
//var dict = [Int:Int]()
//
//for i in arrOddSum{
//if dict[i] == nil{
//    dict[i] =  1
//} else {
//dict[i] = dict[i]! + 1
//}
//}
//var sum = 0
//for (key, value) in dict {
//    if value % 2 != 0{
//        sum = (sum + value * key)
//}
//}

//print(sum)

/////////

//var maxContEven = [9, 8, 5, 4, 4, 4, 2, 4, 1]
//
//var ans = 0
//var count = 0
//
//var dict:[Int:[Int]]
//
//for val in maxContEven {
//    if val % 2 == 0{
//count += 1
//} else {
//    ans = max(ans, count)
//count = 0
//}
//ans = max(ans, count)
//}

//print(ans)

///////////

//var sumAllDivisibleK = [15, 16, 10, 9, 6, 7, 17]
//var sum = 0
//var k = 3
//for value in sumAllDivisibleK {
//    if value % k == 0 {
//    sum = sum + value
//}
//}
//
//print(sum)

////////

// 1.Traverse array and separate all non prime in array
// 2.Sort the non prime array
// 3.Traverse the array again and insert value from nonPrimes to sortNonPrime

//var sortNonPrime = [100, 11, 500, 2, 17, 1]
//
//func isPrime(number:Int) -> Bool{
//    return number > 1 && !(2..<number).contains{number%$0 == 0}
//}
//
//var nonPrimes = [Int]()
//
//for i in sortNonPrime {
//    if !isPrime(number: i) {
//        nonPrimes.append(i)
//    }
//}
//
//nonPrimes = nonPrimes.sorted()
//var j = 0
//for (index, i) in sortNonPrime.enumerated() {
//    if !isPrime(number: i) {
//        sortNonPrime.remove(at: index)
//        sortNonPrime.insert(nonPrimes[j], at: index)
//        j = j + 1
//
//    }
//}
//
//print(sortNonPrime)

//
//
//public class BST<T:Comparable> {
//    private(set) public var value:T
//    private(set) public var parent:BST?
//    private(set) public var left:BST?
//    private(set) public var right:BST?
//
//
//    public var isLeftChild: Bool {
//        return parent?.left === self
//    }
//
//    public var isRightChild: Bool {
//        return parent?.right === self
//    }
//
//
//    public init(value:T) {
//        self.value = value
//    }
//
//    public func insert(value:T) {
//        if value < self.value {
//            if let left = left {
//                left.insert(value: value)
//            } else {
//                left = BST(value: value)
//                left?.parent = self
//            }
//        } else {
//            if let right = right {
//                right.insert(value: value)
//            } else {
//                right = BST(value: value)
//                right?.parent = self
//            }
//        }
//    }
//
//    func search(value:T) -> BST? {
//        var node:BST? = self
//        while let n = node {
//            if value < n.value {
//                node = n.left
//            } else if value > n.value {
//                node = n.right
//            } else {
//                return node
//            }
//        }
//        return nil
//    }
//
//    public func traverseInOrder(process: (T) -> Void) {
//        left?.traverseInOrder(process: process)
//        process(value)
//        right?.traverseInOrder(process: process)
//    }
//
//    public func traversePostOrder(process: (T) -> Void) {
//        left?.traversePostOrder(process: process)
//        right?.traversePostOrder(process: process)
//        process(value)
//    }
//
//    public func traversePreOrder(process: (T) -> Void) {
//        process(value)
//        left?.traversePreOrder(process: process)
//        right?.traversePreOrder(process: process)
//    }
//
//    public func reconnectParentTo(node: BST?) {
//        if let parent = parent {
//            print(parent)
//            if isLeftChild {
//                parent.left = node
//            } else {
//                parent.right = node
//            }
//        }
//        node?.parent = parent
//    }
//
//    public func minium() -> BST {
//        var node = self
//        while let next = node.left {
//            node = next
//        }
//        return node
//    }
//
//    public func maximum() -> BST {
//        var node = self
//        while let next = node.right {
//            node = next
//        }
//
//        return node
//    }
//
//
//    //@discardableResult
//    public func remove() -> BST? {
//        let replacement : BST?
//        if let right = right {
//            replacement = right.minium()
//        } else if let left = left{
//            replacement = left.maximum()
//        } else {
//            replacement = nil
//        }
//
//        replacement?.remove()
//
//        replacement?.right = right
//        replacement?.left = left
//        right?.parent = replacement
//        left?.parent = replacement
//        reconnectParentTo(node: replacement)
//
//        parent = nil
//        left = nil
//        right = nil
//
//        return replacement
//    }
//
//    public func map(formula: (T) -> T) -> [T] {
//        var a = [T]()
//        if let left = left { a += left.map(formula: formula) }
//        a.append(formula(value))
//        if let right = right { a += right.map(formula: formula) }
//        return a
//    }
//
//    public func toArray() -> [T] {
//        return map { $0 }
//    }
//
//}
//
//
//extension BST: CustomStringConvertible {
//    public var description: String {
//        var s = ""
//        if let left = left {
//            s += "(\(left.description)) <- "
//        }
//        s += "\(value)"
//        if let right = right {
//            s += " -> (\(right.description))"
//        }
//        return s
//    }
//}
//
//let tree = BST<Int>(value: 7)
//
//tree.insert(value: 2)
//tree.insert(value: 5)
//tree.insert(value: 10)
//tree.insert(value: 9)
//tree.insert(value: 1)
//
//print(tree.description)
//
//tree.search(value: 9)
//
//
//
//tree.traverseInOrder { (value) in
//    print(value)
//}
//
//print("\n")
//
//tree.traversePostOrder { (value) in
//    print(value)
//}
//
//print("\n")
//
//tree.traversePreOrder { (value) in
//    print(value)
//}
//
//
////tree.description
//
//
//tree.toArray()
//
//tree.remove()
//tree.toArray()
//tree.description



// Matrix

// Print Matrix in spiral format

/**
 *      1  2  3  4
 *      5  6  7  8
 *      9  10 11 12
 *      13 14 15 16
 */

//func printMatrixSpirally(arr:[[Int]], m:Int, n:Int) {
//    var k = 0, l = 0
//    var last_row = m - 1, last_col = n - 1
//
//    while k <= last_row  && l <= last_col{
//        for i in l...last_col{
//            print(arr[k][i])
//        }
//        k+=1
//        for i in k...last_row {
//            print(arr[i][last_col])
//        }
//        last_col-=1
//
//        if k <= last_row {
//            for i in (l...last_col).reversed(){
//
//                 print(arr[last_row][i])
//            }
//            last_row-=1
//        }
//        if l <= last_col{
//            for i in (k...last_row).reversed(){
//                print(arr[i][l])
//            }
//            l+=1
//        }
//    }
//}



//printMatrixSpirally(arr: [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14, 15],[16,17,18,19, 20]], m: 4, n: 5)


// Rotate matrix clockwise
//

//func rotateMatrixCW(array:[[Int]], m:Int, n:Int) {
//    var k = 0, l = 0
//    var prev, curr:Int
//    var arr = array
//
//    var noRow = m, noCol = n
//
//    while k <  noRow && l < noCol {
//
//        if k+1 == noRow || l+1 == noCol {
//            break
//        }
//
//        prev = arr[k+1][l]
//
//        for i in l..<noCol{
//            curr = arr[k][i]
//            arr[k][i] = prev
//            prev = curr
//        }
//
//        k+=1
//
//        for i in k..<m{
//            curr = arr[i][noCol-1]
//            arr[i][noCol-1] = prev
//            prev = curr
//        }
//        noCol-=1
//
//        if (k<noRow) {
//            for i in (l..<noCol).reversed() {
//                curr = arr[noRow-1][i]
//                arr[noRow-1][i] = prev
//                prev = curr
//            }
//            noRow-=1
//        }
//
//        if (l<noCol){
//            for i in (k..<noRow).reversed() {
//                curr = arr[i][l]
//                arr[i][l] = prev
//                prev = curr
//            }
//            l+=1
//        }
//
//        for i in 0...m-1
//        {
//            for j in 0...n-1 {
//            print("\(arr[i][j]) ")
//        }
//
//    }
//}
//}
//rotateMatrixCW(array: [[1,2,3],[4,5,6], [7,8,9]], m: 3, n: 3)




//BottomView

class Node{
    var left:Node?
    var right:Node?
    var value:Int?
    var hd:Int?
    
    init(value:Int) {
        self.value = value
        hd = 0
        left = nil
        right = nil
    }
    
}


class Tree{
    var root:Node?
    
    init() {}
    
    init(node:Node) {
        root = node
    }
    
    func bottomView() {
        if root == nil {
            return
        }

        var hd = 0

        var dict = [Int:Int]()
        var list = [Node]()

        root?.hd = hd
        list.append(root!)

        while !list.isEmpty {
            var a = list.removeFirst()
            hd = a.hd!

            dict[hd] = a.value
            if a.left != nil{

                a.left?.hd = hd - 1
                list.append(a.left!)
            }

            if a.right != nil {
                a.right?.hd = hd+1
                list.append(a.right!)
            }
        }

        var dict1 = dict.sorted{$0<$1}
        for (key,value) in dict1 {
            print(value, terminator: " ")
        }

    }
    
    // Right View of binary tree
    
    func rightView()  {
        if root == nil {
            return
        }

        var queue = [Node]()
        queue.append(root!)

        print("\n")
        while !queue.isEmpty {
            let size = queue.count
            for i in 1...size{
                let temp = queue.removeFirst()
                if i == size {
                    print(temp.value!, terminator: " ")

                }

                if temp.left != nil {
                    queue.append(temp.left!)
                }

                if temp.right != nil {
                    queue.append(temp.right!)
                }
            }
        }
    }
    
    // left view
    
    func leftView() {
        if root == nil {
            return
        }
        print("\n")

        var queue = [Node]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let size = queue.count
            for i in 1...size {
                let temp = queue.removeFirst()
                if i == 1{
                    print(temp.value!, terminator: " ")
                }
                
                if temp.left != nil {
                    queue.append(temp.left!)
                }
                
                if temp.right != nil {
                    queue.append(temp.right!)
                }
            }
        }
        
        
    }
}







var root =  Node(value: 10);
root.left =  Node(value: 2);
root.right =  Node(value: 3);
root.left?.left =  Node(value: 7);
root.left?.right =  Node(value: 8);
root.right?.right =  Node(value: 15);
root.right?.left =  Node(value: 12);
root.right?.right?.left =  Node(value: 14);

var tree = Tree(node: root)
tree.bottomView()
tree.rightView()
tree.leftView()




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
}

var linkedList = LinkedList()
linkedList.head = LinkedNode(value: 3)

var one  = LinkedNode(value: 4)
var two  = LinkedNode(value: 5)
var three  = LinkedNode(value: 8)
var four  = LinkedNode(value: 3)


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

