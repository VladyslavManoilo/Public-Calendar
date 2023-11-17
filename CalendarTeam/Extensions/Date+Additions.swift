//
//  Date+Additions.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import Foundation

extension Date {
    private var calendar: Calendar {
        return .current
    }

    var nullifiedTime: Date {
        guard let date = calendar.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            return self
        }
        return date
    }

    var dayAfter: Date? {
        return calendar.date(byAdding: .day, value: 1, to: self)
    }

    var dayBefore: Date? {
        return calendar.date(byAdding: .day, value: -1, to: self)
    }

    var hourAfter: Date? {
        return calendar.date(byAdding: .hour, value: 1, to: self)
    }
    
    var minute: Int {
        let components = calendar.dateComponents([.minute], from: self)
        return components.minute ?? 0
    }
    
    var cleanTimeStirng: String {
        let dateFormat = DateFormatter()
        dateFormat.locale = .enUS
        dateFormat.dateFormat = "hh:mm"
        return dateFormat.string(from: self)
    }
    
    var weekDayAbbreviated: String {
        let dateFormat = DateFormatter()
        dateFormat.locale = .enUS
        dateFormat.dateFormat = "EEE"
        return dateFormat.string(from: self)
    }

    var monthAndDayAbbreviated: String {
        let dateFormat = DateFormatter()
        dateFormat.locale = .enUS
        dateFormat.dateFormat = "MMM d"
        return dateFormat.string(from: self)
    }

    func withTime(hours: Int, minutes: Int) -> Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        components.hour = hours
        components.minute = minutes
        return calendar.date(from: components) ?? self
    }

    func includes(date: Date) -> Bool {
        let currentDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        return currentDateComponents.year == dateComponents.year &&
        currentDateComponents.month == dateComponents.month &&
        currentDateComponents.day == dateComponents.day &&
        currentDateComponents.hour == dateComponents.hour
    }

    func withTime(timeString: String) -> Date {
        var currentDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        guard let date = dateFormatter.date(from: timeString) else {
            return self
        }

        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        currentDateComponents.hour = dateComponents.hour
        currentDateComponents.minute = dateComponents.minute
        return calendar.date(from: currentDateComponents) ?? self
    }
}
