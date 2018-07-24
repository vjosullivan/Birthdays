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
        XCTAssertNotNil(CalendarManager(eventStore: MockEventStore(accessStatus: .denied)))
    }

    /// Test: Show the calendar access denied is handled correctly.
    func testAccessDenied() {
        XCTAssertEqual(CalendarAccess.denied, CalendarManager(eventStore: MockEventStore(accessStatus: .denied)).calendarAccessStatus())
    }

    /// Test: Show the calendar access authorized is handled correctly.
    func testAccessGranted() {
        XCTAssertEqual(CalendarAccess.permitted, CalendarManager(eventStore: MockEventStore(accessStatus: .authorized)).calendarAccessStatus())
    }

    /// Test: Show the calendar access unknown is handled correctly.
    func testAccessUnknown() {
        XCTAssertEqual(CalendarAccess.unknown, CalendarManager(eventStore: MockEventStore(accessStatus: .unknown)).calendarAccessStatus())
    }

    /// Test: If calendar access is granted then the "granted" completion should be executed.
    func testAccessGrantedInvokesGrantAction() {
        // Use expectation to handle asynchronous code.
        let expectation = self.expectation(description: "Granted")
        CalendarManager(eventStore: MockEventStore(accessStatus: .authorized)).requestCalendarAccess(
            completionIfGranted: {
                XCTAssertTrue(true)
                expectation.fulfill()
        },
            completionIfDenied: {
                XCTAssertTrue(false)
        })
        waitForExpectations(timeout: 0.1, handler: nil)
    }

    /// Test: If calendar access is denied then the "denied" completion should be executed.
    func testAccessDeniedInvokesDeniedAction() {
        // Use expectation to handle asynchronous code.
        let expectation = self.expectation(description: "Denied")
        CalendarManager(eventStore: MockEventStore(accessStatus: .denied)).requestCalendarAccess(
            completionIfGranted: {
                XCTAssertTrue(false)
        },
            completionIfDenied: {
                XCTAssertTrue(true)
                expectation.fulfill()
        })
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
