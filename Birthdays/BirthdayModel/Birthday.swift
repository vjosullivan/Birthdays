//
//  Birthday.swift
//  Birthdays
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Birthday {
    let name: String
    let year: Int?
    let month: Int
    let day: Int

    var birthYearKnown: Bool {
        return year != nil
    }
}

extension Birthday: Equatable {
    static func == (lhs: Birthday, rhs: Birthday) -> Bool {
        return lhs.month == rhs.month && lhs.day == rhs.day
    }
}

extension Birthday: Comparable {
    static func < (lhs: Birthday, rhs: Birthday) -> Bool {
        return (lhs.month < rhs.month) || ((lhs.month == rhs.month) && (lhs.day < rhs.day))
    }
}
