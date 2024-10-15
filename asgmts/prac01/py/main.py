from typing import List


def insertionSort(arr: List[int]) -> List[int]:
    arrLen: int = len(arr)

    # if arr length is zero or contains only 1 elem, it is sorted already
    if arrLen < 2:
        return arr

    # cp arr to avoid mutation
    sortedArr: List[int] = arr[:]

    for idx in range(1, arrLen):  # iterate arr starting from 2nd elem
        elem: int = sortedArr[idx]  # store current element
        prev_idx: int = idx - 1

        # shift next elem to right if greater than current elem
        while prev_idx >= 0 and elem < sortedArr[prev_idx]:
            sortedArr[prev_idx + 1] = sortedArr[prev_idx]
            prev_idx -= 1
        sortedArr[prev_idx + 1] = elem

    return sortedArr
