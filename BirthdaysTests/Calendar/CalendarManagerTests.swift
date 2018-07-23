//
//  CalendarManagerTests.swift
//  BirthdaysTests
//
//  Created by Vincent O'Sullivan on 23/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Birthdays

class CalendarManagerTests: XCTestCase {

    /// Test: Prove that an instance of the CalendarManager can be created.
    func testCreatable() {
        XCTAssertNotNil(CalendarManager(eventStore: MockEventStore()))
    }
}
