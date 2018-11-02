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



public class BST<T:Comparable> {
    private(set) public var value:T
    private(set) public var parent:BST?
    private(set) public var left:BST?
    private(set) public var right:BST?
    
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }

    
    public init(value:T) {
        self.value = value
    }
    
    public func insert(value:T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BST(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BST(value: value)
                right?.parent = self
            }
        }
    }

    func search(value:T) -> BST? {
        var node:BST? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func reconnectParentTo(node: BST?) {
        if let parent = parent {
            print(parent)
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minium() -> BST {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BST {
        var node = self
        while let next = node.right {
            node = next
        }
        
        return node
    }

    
    //@discardableResult
    public func remove() -> BST? {
        let replacement : BST?
        if let right = right {
            replacement = right.minium()
        } else if let left = left{
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node: replacement)
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }
    
}


extension BST: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

let tree = BST<Int>(value: 7)

tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

print(tree.description)

tree.search(value: 9)



tree.traverseInOrder { (value) in
    print(value)
}

print("\n")

tree.traversePostOrder { (value) in
    print(value)
}

print("\n")

tree.traversePreOrder { (value) in
    print(value)
}


//tree.description


tree.toArray()

tree.remove()
tree.toArray()
//tree.description





