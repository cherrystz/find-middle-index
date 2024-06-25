//
//  main.swift
//  findMiddleIndex
//
//  Created by pharuthapol on 18/6/2567 BE.
//

import Foundation

public func checkSameKey(_ d1: [Int: [Int]], _ d2: [Int: [Int]]) -> [Int]? {
    let array1 = Array(d1.keys)
    let array2 = Array(d2.keys)

    let set1 = Set(array1)
    let set2 = Set(array2)

    let intersection = set1.intersection(set2)

    if !intersection.isEmpty {
        return Array(intersection)
    }
    return nil
}

let input = readLine()
let trimmedInput = input?.trimmingCharacters(in: .init(charactersIn: "[]"))
let mapInput = trimmedInput?.components(separatedBy: ",")
let array = mapInput?.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }

var leftSums: [Int: [Int]] = [:]
var rightSums: [Int: [Int]] = [:]
var possiblyMiddleIndex: [Int] = []

if let intArray = array {
    var leftSumArray: [Int] = []
    var rightSumArray: [Int] = []
    for firstIndex in 0..<intArray.count {
        let lastIndex = intArray.count-1-firstIndex
        leftSumArray.append(intArray[firstIndex])
        rightSumArray.append(intArray[lastIndex])
        
        let leftSum = leftSumArray.reduce(0, +)
        let rightSum = rightSumArray.reduce(0, +)
        
        leftSums[leftSum] = leftSumArray
        rightSums[rightSum] = rightSumArray
    }
}

if let keys = checkSameKey(leftSums, rightSums) {
    for sum in keys {
        if let intArray = array,
           let leftSumIndex = leftSums[sum]?.count,
           let rightSumIndex = rightSums[sum]?.count {
            if (intArray.count - rightSumIndex) - (leftSumIndex - 1) == 2 {
                possiblyMiddleIndex.append(leftSumIndex)
            }
        }
    }
}

if !possiblyMiddleIndex.isEmpty {
    for middleIndex in possiblyMiddleIndex {
        print("middle index is \(middleIndex)")
    }
} else {
    print("index not found")
}
