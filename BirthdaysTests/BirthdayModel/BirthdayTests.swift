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
    /// Test: Create a birthday.
    func testCreatable() {
        XCTAssertNotNil(Birthday(name: "John Doe", year: nil, month: 7, day: 13))
    }

    /// Test: Year of birth is optional.  Can we query to see if it's there?
    func testBirthYear() {
        XCTAssertTrue(Birthday(name: "John Doe", year: 1961, month: 7, day: 13).birthYearKnown)
        XCTAssertFalse(Birthday(name: "John Doe", year: nil, month: 7, day: 13).birthYearKnown)
    }

    /// Test: Show that same birthdays can be spotted.
    func testEqualBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 7, day: 13)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertEqual(b1, b2)
    }

    /// Test: Show that birthdays in different months are different birthdays.
    func testUnequalMonthBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 6, day: 13)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertNotEqual(b1, b2)
    }

    /// Test: Show that birthdays on different days are different birthdays.
    func testUnequalDayBirthdays() {
        let b1 = Birthday(name: "A", year: 1961, month: 7, day: 12)
        let b2 = Birthday(name: "B", year: nil,  month: 7, day: 13)
        XCTAssertNotEqual(b1, b2)
    }

    /// Test: Show that birthdays can be compared (before/after/same).
    func testComparableBirthdays1() {
        let b1 = Birthday(name: "Mr A", year: 1961, month: 7, day: 12)
        let b2 = Birthday(name: "Mrs B", year: nil,  month: 7, day: 13)
        let b3 = Birthday(name: "Mme C", year: nil,  month: 7, day: 13)
        XCTAssertTrue(b1 < b2)
        XCTAssertTrue(b2 > b1)
        XCTAssertTrue(b2 == b3)
    }
}
