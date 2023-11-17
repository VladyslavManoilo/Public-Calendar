//
//  CalendarEvent.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

protocol CalendarEvent {
    var id: String { get }
    var title: String { get }
    var description: String { get }
    var date: Date { get }
    var color: Color? { get }
}
