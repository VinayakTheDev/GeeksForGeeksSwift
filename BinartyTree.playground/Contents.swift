import UIKit

var str = "Hello, playground"


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
