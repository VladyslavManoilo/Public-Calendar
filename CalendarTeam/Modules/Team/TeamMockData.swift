//
//  TeamMockData.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct Team {
    let members: [TeamMember]
}

struct TeamMember: CalendarUser {
    let id: String
    let avatarURL: URL?
    let name: String
    let appointments: [Appointment]
    let coffeBreaks: [CoffeeBreak]

    var events: [CalendarEvent] {
        return appointments + coffeBreaks
    }
}

struct Appointment: CalendarEvent {
    let id: String
    let clientName: String
    let services: String
    let date: Date
    let status: AppointmentStatus

    var title: String {
        return clientName
    }
    
    var description: String {
        return services
    }

    var color: Color? {
        switch status {
        case .done:
            return .appAppointmentDone
        case .inProgress:
            return .appAppointmentInProgress
        case .needsCheckout:
            return .appAppointmentNeedsCheckout
        case .noShow:
            return .appAppointmentNoShow
        case .upcoming:
            return .appAppointmentUpcoming
        }
    }
}


enum AppointmentStatus {
    case done
    case inProgress
    case needsCheckout
    case noShow
    case upcoming
}

struct CoffeeBreak: CalendarEvent {
    var id: String
    let time: String
    let title: String = "Coffee break"
    let description: String = ""
    let color: Color? = nil
    
    var date: Date {
        return Date.now.withTime(timeString: time)
    }
}

struct MockDataGenerator {
    static func generateTeam() -> Team {
        Team(members: [
            TeamMember(id: "0", avatarURL: URL(string: "https://upload.wikimedia.org/wikipedia/ru/c/c6/Jon_Snow_HBO.jpg"), name: "John", appointments: [
                Appointment(id: "0", clientName: "Mike M.", services: "Mid taper, Beard", date: Date.now.withTime(hours: 8, minutes: 0), status: .done),
                Appointment(id: "1", clientName: "Antwaan H.", services: "Mid taper", date: Date.now.withTime(hours: 9, minutes: 0), status: .noShow),
                Appointment(id: "2", clientName: "Jacob J.", services: "Bald fade", date: Date.now.withTime(hours: 11, minutes: 0), status: .upcoming),
                Appointment(id: "3", clientName: "Brendan P.", services: "Bald fade, Beard", date: Date.now.withTime(hours: 12, minutes: 0), status: .upcoming),
                Appointment(id: "4", clientName: "Jacob J.", services: "Bald fade", date: Date.now.dayAfter!.withTime(hours: 11, minutes: 0), status: .upcoming),
                Appointment(id: "5", clientName: "Brendan P.", services: "Bald fade, Beard", date: Date.now.dayAfter!.dayAfter!.withTime(hours: 12, minutes: 0), status: .upcoming)
            ], coffeBreaks: [CoffeeBreak(id: "0", time: "10:00")]),
            TeamMember(id: "1", avatarURL: URL(string: "https://upload.wikimedia.org/wikipedia/ru/3/39/Gwendoline_Christie_as_Brienne_of_Tarth.jpg"), name: "Brian", appointments: [
                Appointment(id: "0", clientName: "Alex W.", services: "Men’s haircut", date: Date.now.withTime(hours: 9, minutes: 0), status: .needsCheckout),
                Appointment(id: "1", clientName: "Marco D.", services: "Men’s haircut", date: Date.now.withTime(hours: 10, minutes: 0), status: .inProgress),
                Appointment(id: "2", clientName: "Jacob J.", services: "Bald fade, Eyebrows", date: Date.now.withTime(hours: 12, minutes: 0), status: .upcoming)
            ], coffeBreaks: [CoffeeBreak(id: "0", time: "11:00")]),
            TeamMember(id: "2", avatarURL: URL(string: "https://upload.wikimedia.org/wikipedia/ru/b/b0/Peter_Dinklage_as_Tyrion_Lannister.jpg"), name: "Mike", appointments: [
                Appointment(id: "0", clientName: "John B.", services: "Mid taper", date: Date.now.withTime(hours: 8, minutes: 0), status: .done),
                Appointment(id: "1", clientName: "Dave V.", services: "Men’s haircut", date: Date.now.withTime(hours: 11, minutes: 0), status: .upcoming),
            ], coffeBreaks: [CoffeeBreak(id: "0", time: "09:00")])
        ])
    }
}
