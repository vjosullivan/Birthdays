//
//  Birthdays.swift
//  Birthdays
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Birthdays {

    private let birthdays: [Birthday]

    init() {
        self.init([Birthday]())
    }

    init(_ birthdays: [Birthday]) {
        self.birthdays = birthdays
    }

    /// Returns an array of birthdays sorted from the beginning of the year.  Note that the year
    /// of birth is not part of the birthday sort order, only the year and day.  The sort order of
    /// multiple same birthdays is not determined.
    ///
    /// - Returns: A sorted array of birthdays.
    ///
    func sorted() -> [Birthday] {
        return birthdays.sorted()
    }

    /// Returns an array of birthdays sorted from the beginning of the given month and wrapping around the
    /// year end, ending before arriving back at the given month.  Note that the year
    /// of birth is not part of the birthday sort order, only the year and day.  The sort order of
    /// multiple same birthdays is not determined.
    ///
    /// - Parameter month: The birth month from which to start the sort.
    /// - Returns: A sorted array of birthdays.
    ///
    func sorted(month: Int) -> [Birthday] {
        let earlierBirthdays = birthdays.filter({ $0.month <  month }).sorted()
        let laterBirthdays   = birthdays.filter({ $0.month >= month }).sorted()
        return laterBirthdays + earlierBirthdays
    }
}
