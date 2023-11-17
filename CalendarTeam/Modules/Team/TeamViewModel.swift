//
//  TeamViewModel.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import Foundation

class TeamViewModel: ObservableObject {
    let waitlistValue: Int = 7
    
    @Published var selectedDate = Date.now.nullifiedTime {
        willSet {
            self.closeDates = closeDatesAdapted(forSelectedDate: newValue)
    
            guard let newSelectedIndex = closeDates.firstIndex(of: newValue) else {
                return
            }

            selectedCloseDateIndex = newSelectedIndex
        }
    }
    var selectedCloseDateIndex: Int = 0
    
    var closeDates = [Date]()
    
    var team = MockDataGenerator.generateTeam()

    func initialStateSelected() {
        self.selectedDate = Date.now.nullifiedTime
    }
    
    func newDateIndexSelected(_ index: Int) {
        selectedDate = self.closeDates[index]
    }

   private func closeDatesAdapted(forSelectedDate selectedDate: Date) -> [Date] {
        var dates = [Date]()
        if let dayBefore = selectedDate.dayBefore {
            dates.append(dayBefore)
        }
        
        dates.append(selectedDate)

        if let dayAfter = selectedDate.dayAfter {
            dates.append(dayAfter)
        }

        return dates
    }

}
