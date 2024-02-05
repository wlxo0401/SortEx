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


// 버블 정렬
print("버블 정렬 : ", bubbleSort(array: unsortedArray))
// 선택 정렬
print("선택 정렬 : ", selectSort(array: unsortedArray))
// 삽입 정렬
print("삽입 정렬 : ", insertSort(array: unsortedArray))
