//
//  BirthdaysTests.swift
//  BirthdaysTests
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Birthdays

class BirthdaysTests: XCTestCase {

    /// Can create an empty collection of Birthdays.
    func testCreatableNoBirthdays() {
        XCTAssertNotNil(Birthdays())
    }

    /// Can create a (non-empty) collection of Birthdays.
    func testCreatableOneBirthday() {
        let birthday = Birthday(name: "Me", year: 1961, month: 7, day: 13)
        XCTAssertNotNil(Birthdays([birthday]))
    }

    /// Can create a (non-empty) collection of Birthdays.
    func testCreatableMultipleBirthdays() {
        let birthday1 = Birthday(name: "Me", year: 1961, month: 7, day: 13)
        let birthday2 = Birthday(name: "Mrs Me", year: 1963, month: 7, day: 4)
        XCTAssertNotNil(Birthdays([birthday1, birthday2]))
    }

    /// Can sort birthdays into order (from Jan 1st to Dec 31st).
    func testSortability() {
        let b06_30 = Birthday(name: "June Ender",   year: 1961, month: 6,  day: 30)
        let b06_04 = Birthday(name: "June Early",   year: 1962, month: 6,  day:  4)
        let b04_13 = Birthday(name: "April Shower", year: 1963, month: 4,  day: 13)
        let b11_04 = Birthday(name: "Dr November",  year: 1964, month: 11, day:  4)
        let birthdays = Birthdays([b06_04, b11_04, b04_13, b06_30]).sorted()
        XCTAssertEqual(b04_13, birthdays[0])
        XCTAssertEqual(b06_04, birthdays[1])
        XCTAssertEqual(b06_30, birthdays[2])
        XCTAssertEqual(b11_04, birthdays[3])
    }

    /// Can sort without crashing when no birthday are present.
    func testSortabilityWhenEmpty() {
        XCTAssertEqual(0, Birthdays().sorted().count)
    }
}
