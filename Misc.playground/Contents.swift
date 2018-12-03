import UIKit

var str = "Hello, playground"


var arrOddSum = [10, 20, 30, 40, 40]

var dict = [Int:Int]()

for i in arrOddSum{
if dict[i] == nil{
    dict[i] =  1
} else {
dict[i] = dict[i]! + 1
}
}
var sum = 0
for (key, value) in dict {
    if value % 2 != 0{
        sum = (sum + value * key)
}
}

print(sum)

/////////

var maxContEven = [9, 8, 5, 4, 4, 4, 2, 4, 1]

var ans = 0
var count = 0

var dict1:[Int:[Int]]

for val in maxContEven {
    if val % 2 == 0{
count += 1
} else {
    ans = max(ans, count)
count = 0
}
ans = max(ans, count)
}

print(ans)

///////////

var sumAllDivisibleK = [15, 16, 10, 9, 6, 7, 17]
var sum1 = 0
var k = 3
for value in sumAllDivisibleK {
    if value % k == 0 {
    sum1 = sum1 + value
}
}

print(sum1)

////////

// 1.Traverse array and separate all non prime in array
// 2.Sort the non prime array
// 3.Traverse the array again and insert value from nonPrimes to sortNonPrime

var sortNonPrime = [100, 11, 500, 2, 17, 1]

func isPrime(number:Int) -> Bool{
    return number > 1 && !(2..<number).contains{number%$0 == 0}
}

var nonPrimes = [Int]()

for i in sortNonPrime {
    if !isPrime(number: i) {
        nonPrimes.append(i)
    }
}

nonPrimes = nonPrimes.sorted()
var j = 0
for (index, i) in sortNonPrime.enumerated() {
    if !isPrime(number: i) {
        sortNonPrime.remove(at: index)
        sortNonPrime.insert(nonPrimes[j], at: index)
        j = j + 1

    }
}

print(sortNonPrime)
