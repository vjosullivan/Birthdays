//
//  MockEventStore.swift
//  BirthdaysTests
//
//  Created by Vincent O'Sullivan on 23/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation
@testable import Birthdays

class MockEventStore: EventStore {

    private let accessStatus: AuthorizationStatus

    init(accessStatus: AuthorizationStatus) {
        self.accessStatus = accessStatus
    }
    
    func requestAccess(to entityType: EntityType, completion: @escaping (Bool, Error?) -> Void) {
        completion(accessStatus == .authorized, nil)
    }

    func authorizationStatus(for entityType: EntityType) -> AuthorizationStatus {
        return accessStatus
    }
}
