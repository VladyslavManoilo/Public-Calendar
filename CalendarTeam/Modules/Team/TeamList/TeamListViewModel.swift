//
//  TeamListViewModel.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 16.11.2023.
//

import Foundation

class TeamListViewModel: ObservableObject {
    struct Section {
        let title: String
        let appointments: [Appointment]
    }
    
    @Published var selectedMember: TeamMember? {
        willSet {
            sections = TeamListViewModel.sections(forMember: newValue)
        }
    }
    
    let teamMembers: [TeamMember]
    var sections: [Section]

    init(teamMembers: [TeamMember]) {
        self.teamMembers = teamMembers
        let firstMember = teamMembers.first
        self.selectedMember = teamMembers.first
        self.sections = TeamListViewModel.sections(forMember: firstMember)
    }

    private static func sections(forMember member: TeamMember?) -> [Section] {
        guard let member = member else {
            return []
        }

        var sections: [Section] = []
        let appointments = member.appointments
           
        let groupedAppointments = Dictionary(grouping: appointments) { appointment in
            Calendar.current.startOfDay(for: appointment.date)
        }
           
        for (date, appointments) in groupedAppointments {
            var title = ""
            if Calendar.current.isDateInToday(date) {
                title = "Today".uppercased()
            } else if Calendar.current.isDateInTomorrow(date) {
                title = "Tomorrow".uppercased()
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale.enUS
                dateFormatter.dateFormat = "EEE MMM d"
                title = dateFormatter.string(from: date).uppercased()
            }
               
            sections.append(Section(title: title, appointments: appointments))
        }
        
        let sortedSections = sections.sorted { $0.appointments[0].date < $1.appointments[0].date }
           
        return sortedSections
    }

    func isMemberSelected(_ member: TeamMember) -> Bool {
        return selectedMember?.id == member.id
    }

    func memberChanged(toMember member: TeamMember) {
        self.selectedMember = member
    }
}
