//
//  BirthdayTests.swift
//  BirthdaysTests
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Birthdays

class BirthdayTests: XCTestCase {
    /// Create a birthday.
    func testCreatable() {
        XCTAssertNotNil(Birthday(name: "John Doe", year: nil, month: 7, day: 13))
    }

    /// Can we tell if we know what year?
    func testBirthYear() {
        XCTAssertTrue(Birthday(name: "John Doe", year: 1961, month: 7, day: 13).birthYearKnown)
        XCTAssertFalse(Birthday(name: "John Doe", year: nil, month: 7, day: 13).birthYearKnown)
    }

    func testEqualBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 7, day: 13)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertEqual(b1, b2)
    }

    func testUnequalMonthBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 6, day: 13)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertNotEqual(b1, b2)
    }

    func testUnequalDayBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 7, day: 12)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertNotEqual(b1, b2)
    }

    func testComparableBirthdays1() {
        let b1 = Birthday(name: "Mr A", year: 1961, month: 7, day: 12)
        let b2 = Birthday(name: "Mrs B", year: nil,  month: 7, day: 13)
        let b3 = Birthday(name: "Mme C", year: nil,  month: 7, day: 13)
        XCTAssertTrue(b1 < b2)
        XCTAssertTrue(b2 > b1)
        XCTAssertTrue(b2 == b3)
    }
}
