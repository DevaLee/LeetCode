//
//  StringTest.swift
//  LeetCodeTests
//
//  Created by 李玉臣 on 2020/9/2.
//  Copyright © 2020 LYfinacial.com. All rights reserved.
//

import XCTest
@testable import LeetCode

class StringTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testReverse(){
        var chars:[Character] = ["h","e","l","l","o"]

        StringExercise().reverseString(&chars)
        XCTAssert(true)
    }

    func testReverseInt(){
        let num = StringExercise().reverse(-123)
        XCTAssert(num == -321)

    }

    func testCountAndSay(){
        let result = StringExercise().countAndSay(4)
        XCTAssert(result.count > 0)
    }

    func testCommonPrefix(){
       let str = StringExercise().longestCommonPrefix(["hello", "he"])

        XCTAssert(str == "he")
    }

}
