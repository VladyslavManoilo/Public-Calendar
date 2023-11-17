//
//  CalendarViewModel.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 16.11.2023.
//

import Foundation

struct CalendarViewModel {
    let selectedDate: Date
    let users: [CalendarUser]
    let timesheet: [Date]
    let minutes: [Int] = Array(0...60)

    init(selectedDate: Date, users: [CalendarUser]) {
        self.selectedDate = selectedDate
        self.users = users
        self.timesheet = CalendarViewModel.timesheetGenerated(forDate: selectedDate)
    }

    private static func timesheetGenerated(forDate date: Date) -> [Date] {
        var timesheet = [Date]()
        let calendar = Calendar.current
        for hour in 1...24 {
            var components = calendar.dateComponents([.year, .day, .month, .hour, .minute], from: date)
            components.hour = hour
            components.minute = 0
            if let date = calendar.date(from: components) {
                timesheet.append(date)
            }
        }
        return timesheet
    }

    func activeEvents(_ events: [CalendarEvent], for date: Date) -> [CalendarEvent] {
        return events.filter { date.includes(date: $0.date) }
    }
}
