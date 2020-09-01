//
//  ArrayTest.swift
//  LeetCodeTests
//
//  Created by 李玉臣 on 2020/8/30.
//  Copyright © 2020 LYfinacial.com. All rights reserved.
//

import XCTest
@testable import LeetCode

class ArrayTest: XCTestCase {

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

    func testRotateArray(){
        var array = [1, 2, 3]
        ArrayExercise.rotate(&array, 2)

        XCTAssert(array == [2, 3, 1])
    }

    func removeTest(){

    }

}
