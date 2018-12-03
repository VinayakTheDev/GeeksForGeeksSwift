import UIKit

// Matrix

// Print Matrix in spiral format

/**
 *      1  2  3  4
 *      5  6  7  8
 *      9  10 11 12
 *      13 14 15 16
 */

func printMatrixSpirally(arr:[[Int]], m:Int, n:Int) {
    var k = 0, l = 0
    var last_row = m - 1, last_col = n - 1

    while k <= last_row  && l <= last_col{
        for i in l...last_col{
            print(arr[k][i])
        }
        k+=1
        for i in k...last_row {
            print(arr[i][last_col])
        }
        last_col-=1

        if k <= last_row {
            for i in (l...last_col).reversed(){

                 print(arr[last_row][i])
            }
            last_row-=1
        }
        if l <= last_col{
            for i in (k...last_row).reversed(){
                print(arr[i][l])
            }
            l+=1
        }
    }
}



printMatrixSpirally(arr: [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14, 15],[16,17,18,19, 20]], m: 4, n: 5)


// Rotate matrix clockwise


func rotateMatrixCW(array:[[Int]], m:Int, n:Int) {
    var k = 0, l = 0
    var prev, curr:Int
    var arr = array

    var noRow = m, noCol = n

    while k <  noRow && l < noCol {

        if k+1 == noRow || l+1 == noCol {
            break
        }

        prev = arr[k+1][l]

        for i in l..<noCol{
            curr = arr[k][i]
            arr[k][i] = prev
            prev = curr
        }

        k+=1

        for i in k..<m{
            curr = arr[i][noCol-1]
            arr[i][noCol-1] = prev
            prev = curr
        }
        noCol-=1

        if (k<noRow) {
            for i in (l..<noCol).reversed() {
                curr = arr[noRow-1][i]
                arr[noRow-1][i] = prev
                prev = curr
            }
            noRow-=1
        }

        if (l<noCol){
            for i in (k..<noRow).reversed() {
                curr = arr[i][l]
                arr[i][l] = prev
                prev = curr
            }
            l+=1
        }

        for i in 0...m-1
        {
            for j in 0...n-1 {
            print("\(arr[i][j]) ")
        }

    }
}
}
rotateMatrixCW(array: [[1,2,3],[4,5,6], [7,8,9]], m: 3, n: 3)

