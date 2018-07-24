//
//  ViewController.swift
//  Birthdays
//
//  Created by Vincent O'Sullivan on 21/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

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
        let calendarManager = CalendarManager(eventStore: EventStoreAdapter())
        switch calendarManager.calendarAccessStatus() {
        case .permitted:
            print("Perform CA is permitted action.")
        case .denied:
            print("Perform CA is denied action.")
        case .unknown:
            // No setting found (probably because this is the first run of this app on the device).
            calendarManager.requestCalendarAccess(
                completionIfGranted: { print("Requested Calendar access granted.  Perform permitted action?") },
                completionIfDenied:  { print("Requested Calendar access denied.  Perform denial action?") })
        }
    }
}
