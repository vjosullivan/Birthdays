//
//  EventStore.swift
//  Birthdays
//
//  Created by Vincent O'Sullivan on 23/07/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation
import EventKit

enum AuthorizationStatus {
    case authorized
    case denied
    case unknown
}

enum EntityType {
    case event
    case reminder
}

protocol EventStore {
    func requestAccess(to entityType: EntityType, completion: @escaping EKEventStoreRequestAccessCompletionHandler)
    func authorizationStatus(for entityType: EntityType) -> AuthorizationStatus
}

class EventStoreAdapter: EventStore {

    private let eventStore: EKEventStore

    init(eventStore: EKEventStore) {
        self.eventStore = eventStore
    }

    func requestAccess(to entityType: EntityType, completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        let type = (entityType == .event) ? EKEntityType.event : EKEntityType.reminder
        eventStore.requestAccess(to: type, completion: completion)
    }

    func authorizationStatus(for entityType: EntityType) -> AuthorizationStatus {
        switch type(of: eventStore).authorizationStatus(for: ekEntityType(entityType)) {
        case .authorized:
            return AuthorizationStatus.authorized
        case .denied, .restricted:
            return AuthorizationStatus.denied
        case .notDetermined:
            return AuthorizationStatus.unknown
        }
    }

    private func ekEntityType(_ entityType: EntityType) -> EKEntityType {
        return (entityType == .event) ? EKEntityType.event : EKEntityType.reminder
    }
}
