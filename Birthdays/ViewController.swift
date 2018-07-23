//
//  ViewController.swift
//  Birthdays
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        calendarAccess()
    }
}

extension ViewController {

    fileprivate func calendarAccess() {
        let calendarManager = CalendarManager(eventStore: EventStoreAdapter(eventStore: EKEventStore()))
        switch calendarManager.calendarAccessStatus() {
        case .permitted:
            print("CA permitted.")
        case .denied:
            print("CA denied.")

        case .unknown:
            // No setting found (probably because this is the first run of this app on the device).
            calendarManager.requestCalendarAccess(
                completionIfGranted: { print("Calendar access permitted.") },
                completionIfDenied:  { print("Calendar access denied.") })
        }
    }
}
