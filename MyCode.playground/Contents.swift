import UIKit

// 예시 배열을 사용하여 삽입 정렬 호출
let unsortedArray = [5, 2, 9, 3, 6, 1, 10, 19, 193]

/*
 버블 정렬
 전체를 반복하면서 한칸 씩 이동하면서 앞에수가 뒤에수보다 크면 자리를 변경.
 전체 반복 한번 한 경우 큰 수가 가장 뒤에 있으니 그 부분은 자원을 아끼기 위해서 뺌
 O(n^2)
 */
func bubbleSort(array: [Int]) -> [Int] {
    var sortedArray = array
    
    for indexI in 0 ..< sortedArray.count {
        for indexJ in 0 ..< (sortedArray.count - 1 - indexI) {
            if sortedArray[indexJ] > sortedArray[indexJ + 1] {
                sortedArray.swapAt(indexJ, indexJ + 1)
            }
        }
    }
    
    return sortedArray
}

/*
 선택 정렬
 맨 앞 값을 시작으로 가장 작은 수를 찾아서 맨 앞 자리와 바꾼다.
 O(n^2)
 */
func selectSort(array: [Int]) -> [Int] {
    var sortedArray = array
    
    for indexI in 0 ..< sortedArray.count {
        var minIndex = indexI
        for indexJ in indexI + 1 ..< sortedArray.count {
            if sortedArray[minIndex] > sortedArray[indexJ] {
                minIndex = indexJ
            }
        }
        
        sortedArray.swapAt(indexI, minIndex)
    }
    
    return sortedArray
}

/*
 삽입 정렬
 숫자를 하나 선택해서 앞에서부터 이미 정렬된 사이에 내 자리를 찾음
 */
func insertSort(array: [Int]) -> [Int] {
    var sortedArray = array
    
    for indexI in 0 ..< sortedArray.count {
        for indexJ in stride(from: indexI, to: 0, by: -1) {
            if sortedArray[indexJ] < sortedArray[indexJ - 1] {
                sortedArray.swapAt(indexJ, indexJ - 1)
            } else {
                break
            }
        }
    }
    
    return sortedArray
}

/*
 퀵 정렬
 값을 하나 선택하여 왼쪽과 오른쪽을 비교하여 정렬
 */
func quickSort(array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array }
    
    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    return quickSort(array: left) + [pivot] + quickSort(array: right)
}

/*
 합병 정렬
 Array를 두개로 나누어 정렬하여 다시 합치는 것
 */
func mergeSort(array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    let center = array.count / 2
    let left = Array(array[0 ..< center])
    let right = Array(array[center ..< array.count])
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        
        return result
    }
    
    return merge(left: mergeSort(array: left), right: mergeSort(array: right))
}


// 버블 정렬
print("버블 정렬 : ", bubbleSort(array: unsortedArray))
// 선택 정렬
print("선택 정렬 : ", selectSort(array: unsortedArray))
// 삽입 정렬
print("삽입 정렬 : ", insertSort(array: unsortedArray))
// 퀵 정렬
print("퀵 정렬 : ", quickSort(array: unsortedArray))
// 합병 정렬
print("합병 정렬 : ", mergeSort(array: unsortedArray))


var dddd: [Int] = [1,3,4,5,6,7,8,9]
var result: [Int] = []
print(result.append(dddd.removeFirst()))
