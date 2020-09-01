//
//  ArrayExercise.swift
//  LeetCode
//
//  Created by 李玉臣 on 2020/8/30.
//  Copyright © 2020 LYfinacial.com. All rights reserved.
//

import Foundation


class ArrayExercise {

    static func maxProfit(_ prices: [Int]) -> Int{
        var maxProfit = 0
        for index in 1..<prices.count {
            let profit = prices[index] - prices[index - 1]
            if profit > 0 {
                maxProfit += profit
            }
        }
        return maxProfit
    }

    static func rotate(_ nums: inout [Int], _ k: Int) {

        var temp = 0
        var previous = 0

        for _ in 0..<k {
            previous = nums[nums.count - 1]

            for j in 0..<nums.count {
                temp = nums[j]
                nums[j] = previous;
                previous = temp
            }
        }
    }


    static func rotateThree(_ nums: inout [Int], _ k: Int) {

        let realK = k % nums.count
        let start0 = 0
        let endK1 = realK - 1
        let startK = realK
        let endTail = nums.count - 1
        reverse(&nums, start: start0, end: endTail)

        reverse(&nums, start: start0, end: endK1)
        reverse(&nums, start: startK, end: endTail)

    }

    private static func reverse(_  nums: inout [Int], start:  Int, end:  Int) {
        var newStart = start
        var newEnd = end
        while newStart < newEnd {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp

            newStart += 1
            newEnd -= 1

        }
    }

//    func containsDuplicate(_ nums: [Int]) -> Bool {
//
//        for(i, num) in nums.enumerated() {
//            for (j, num2) in nums.enumerated() {
//                if num == num2 && i != j {
//                    return true
//                }
//            }
//        }
//        return false
//    }

    func containsDuplicate(_ nums:[Int]) -> Bool {
        let numArray = nums.sorted()
        for (index, num) in numArray.enumerated() {
            if index < numArray.count - 1 && num == numArray[index + 1 ]{
                return true
            }
        }
        return false
    }

    func singleNumber(_ nums: [Int]) -> Int {
        var single = 0
        for num in nums {
            single ^= num
        }
        return single
    }

    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var numTimeDic:[Int: Int] = [Int : Int]()
        var intersectArray:[Int] = [Int]()

        for num in nums1 {
            let time = numTimeDic[num] ?? 0
            numTimeDic[num] = time + 1
        }
        for num in nums2 {
            let time = numTimeDic[num] ?? 0
            if time != 0 {
                intersectArray.append(num)
                numTimeDic[num] = time - 1
            }
        }

        return intersectArray
    }

    func plusOne(_ digits: [Int]) -> [Int] {
        var mutDigits = digits
        var carry = 1
        var reminder = 0
        for i in (0..<mutDigits.count).reversed() {
            carry = (mutDigits[i] + carry) / 10
            reminder = (mutDigits[i] + carry) % 10
            mutDigits[i] = reminder
        }
        var newArray = [Int]()
        if carry > 0 {
            newArray.append(carry)
            for num in mutDigits {
                newArray.append(num)
            }
            return newArray
        }else {
            return mutDigits
        }

    }

    func moveZeroes(_ nums: inout [Int]) {


        for i in 0..<nums.count - 1 {

            for j in 0..<nums.count - i - 1 {
                if nums[j] == 0 {
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }

    func moveZeroesTwo(_ nums: inout [Int]) {
        var lastNoneZeroLocation = 0

        for num in nums {
            if num != 0 {
                nums[lastNoneZeroLocation] = num
                lastNoneZeroLocation += 1
            }
        }

        for i in lastNoneZeroLocation..<nums.count {
           nums[i] = 0
        }
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var resultArray:[Int] = []

        for (i, num) in nums.enumerated() {
            for j in (i + 1..<nums.count) {
                if num + nums[j] == target {
                    resultArray = [i, j]
                }
            }
        }

        return resultArray;
    }


    func twoSumTwo(_ nums:[Int], _ target: Int) -> [Int] {
        var numDic = [Int: Int]()
        var resultArray: [Int] = [Int]()
        for(index, num)  in nums.enumerated() {
            numDic[num] = index
        }

        for (j, num) in nums.enumerated() {
            let forward = target - num

            if numDic.keys.contains(forward) && numDic[forward] != j {
                 resultArray = [numDic[forward] ?? 0, j]
            }
        }

        return resultArray


    }


    private func rotateArray(_ nums: inout [Int],_ k: Int) {
        reverseArray(&nums, 0, nums.count - 1)
        reverseArray(&nums, 0, k - 1)
        reverseArray(&nums, k, nums.count - 1)

    }

    private func reverseArray(_ nums: inout [Int], _ begin: Int, _ end: Int) {

        for i in 0..<(begin + end) / 2 {
            nums.swapAt(i, end - (i - begin))
        }
    }

}
