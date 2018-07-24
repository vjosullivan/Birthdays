//
//  CalendarManager.swift
//  EventTracker
//
//  Created by Vincent O'Sullivan.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum CalendarAccess {
    case unknown
    case permitted
    case denied
}

class CalendarManager {

    let eventStore: EventStore

    init(eventStore: EventStore) {
        self.eventStore = eventStore
    }

    func calendarAccessStatus() -> CalendarAccess {
        let status = eventStore.authorizationStatus(for: EntityType.event)

        switch (status) {
        case .unknown:
            // The first time an app is run on a device, it has no authorisation status.
            return .unknown
        case .authorized:
            return .permitted
        case .denied:
            return .denied
        }
    }

    func requestCalendarAccess(completionIfGranted: (() -> Void)?, completionIfDenied: (() -> Void)?) {
        eventStore.requestAccess(to: EntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in

            if accessGranted == true {
                DispatchQueue.main.async(execute: {
                    completionIfGranted?()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    completionIfDenied?()
                })
            }
        })
    }
}
