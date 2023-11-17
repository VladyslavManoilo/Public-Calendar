//
//  CalendarUser.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import Foundation

protocol CalendarUser {
    var id: String { get }
    var name: String { get }
    var avatarURL: URL? { get }
    var events: [CalendarEvent] { get }
}
