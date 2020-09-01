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


}
