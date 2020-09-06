//
//  StringExercise.swift
//  LeetCode
//
//  Created by 李玉臣 on 2020/9/2.
//  Copyright © 2020 LYfinacial.com. All rights reserved.
//

import Foundation

class StringExercise {
    func reverseString(_ s: inout [Character]) {
        let n = s.count

        for index in 0..<n/2 {
            s.swapAt(index, n - index - 1)
        }
        print(s)
    }

    func reverse(_ x: Int) -> Int {

        var changeX = x

        var total = 0
        while changeX != 0 {
            let n = changeX % 10
            changeX = changeX / 10
            if total > Int.max / 10 || (total == Int.max / 10 && n > 7) {
                return 0
            }
            if total < Int.min / 10 || (total == Int.min / 10 && n < -8) {
                return 0
            }
            total = total * 10 + n

        }
        return total
    }
    func firstUniqChar(_ s: String) -> Int {
        if s.count == 1 {
            return 0
        }

        var map = [Character: Int]()


        for (_, char) in s.enumerated() {
            let num = map[char] ?? 0
            map[char] = num + 1
        }

        var finalIndex = -1
        for (index, char) in s.enumerated() {
            if map[char] == 1 {
                finalIndex = index
                break
            }
        }

        return finalIndex
    }

//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        return isAll(s, t) && isAll(t, s)
//    }
//
//    private func isAll(_ s: String, _ t: String) ->Bool {
//        var isContain = true
//        for char in s {
//            var isExit = false
//            for charT in t {
//                if char == charT {
//                    isExit = true
//                }
//            }
//            if isExit == false {
//               isContain = false
//            }
//
//        }
//        return isContain
//    }

    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        for char in s {
            let num = (dict[char] ?? 0) + 1
            dict[char] = num
        }

        for char in t {
            let num = (dict[char] ?? 0) - 1
            dict[char] = num

        }

        var isSame = true
        for value in dict.values {
            if value != 0 {
                isSame = false
            }
        }

        return isSame
    }

    func isPalindrome(_ s: String) -> Bool {


        Character("a").lowercased()
        var isPalin = true
        let charsArray = s.split(separator: Character(""))

        var i = 0
        var j = charsArray.count - 1
        while i < j {


           // let char : Character = Character(charsArray[i])



        }
        return isPalin

    }

    func strStr(_ haystack: String, _ needle: String) -> Int {
        var i = -1
        let n = haystack.count
        let l = needle.count
        for index in 0..<(n - l - 1 ) {
            let indexBegin = haystack.startIndex
            let indexStart = haystack.index(indexBegin, offsetBy: index)
            let indexEnd = haystack.index(indexStart, offsetBy: l)



            let newStr = haystack[indexStart..<indexEnd]

            if newStr == needle {
                i = index
                break
            }
        }
        return i
     }

    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }

        let previous = countAndSay(n - 1)
        var result = ""

        var count = 1; // count 用来计数
        for i in 0..<previous.count {

            let index = previous.index(previous.startIndex, offsetBy: i);

            if i + 1 < previous.count {
                let nextIndex = previous.index(previous.startIndex, offsetBy: i + 1)
                if previous[index] == previous[nextIndex] {
                    count += 1
                }else {
                    result  =  "\(result)\(count)\(previous[index])"
                    count = 1
                }
            }else {
                result  =  "\(result)\(count)\(previous[index])"
                count = 1
            }

        }
        return result
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        var commonPrefix = strs[0]
        for i in 0..<strs.count {
            commonPrefix = longestCommonPrefix(strs[i], commonPrefix)
        }

        return commonPrefix
    }

    func longestCommonPrefix(_ str1: String, _ str2: String) -> String {

        let minCount = min(str1.count, str2.count)
        print("str1\(str1), str2\(str2)")
        var commonPrefix: Substring = ""
        var index = 0

        while index < minCount && str1[str1.index(str1.startIndex, offsetBy: index)] == str2[str2.index(str2.startIndex, offsetBy: index)] {
             index += 1
        }
        

        let prefixIndex = str1.index(str1.startIndex, offsetBy: index)

        commonPrefix = str1[str1.startIndex..<prefixIndex]
        print(String(commonPrefix))
        return String(commonPrefix)
    }
}
