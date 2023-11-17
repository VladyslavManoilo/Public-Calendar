//
//  TeamView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct TeamView: View {
    @StateObject private var viewModel = TeamViewModel()

    @State private var isListSelected: Bool = false

    var attributedHeaderTitle: AttributedString {
        let weekDayAbbreviated = viewModel.selectedDate.weekDayAbbreviated
        let monthAndDayAbbreviated = viewModel.selectedDate.monthAndDayAbbreviated
        
        var attributedDateString = AttributedString("\(weekDayAbbreviated) ")
        attributedDateString.font = .appTitle
        attributedDateString.foregroundColor = .appGrey900
        
        var attributedMonthAndDayString = AttributedString(monthAndDayAbbreviated)
        attributedMonthAndDayString.font = .appTitleLight
        attributedMonthAndDayString.foregroundColor = .appGrey900
        
        attributedDateString.append(attributedMonthAndDayString)
        
        return attributedDateString
    }

    var selectorSource: [String] {
        return viewModel.closeDates.map { $0.formatted(Date.FormatStyle.dateTime.weekday(.abbreviated).day().locale(.enUS))
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    HeaderView(title: attributedHeaderTitle, isListSelected: $isListSelected)
                    
                    WaitlistView(waitlistValue: viewModel.waitlistValue) {
                        // TODO: handle show button tap
                    }
                }
                .padding(.horizontal, 24)

                if isListSelected {
                    TeamListView(teamMembers: viewModel.team.members)
                } else {
                    CalendarView(selectedDate: viewModel.selectedDate, users: viewModel.team.members)
                }
                
                Spacer()
            }
            
            ZStack {
                HStack(spacing: 0) {
                    CapsulePicker(source: selectorSource, selectedIndex: viewModel.selectedCloseDateIndex) { index in
                        viewModel.newDateIndexSelected(index)
                    }
                    .layoutPriority(1)
                    
                    Spacer()
                    
                    ImageButton(image: .appCalendarIcon)
                    
                    Spacer()
                    
                    ImageButton(image: .appFilterIcon)
                }
                .frame(maxHeight: 48)
                .padding(8)
                .background(Color.appSurfaceCard1)
                .clipShape(Capsule())
            }
            .padding(.horizontal, 24)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding(.top, 32)
        .padding(.bottom, 16)
        .background(Color.appGrey50.ignoresSafeArea())
        .onAppear {
            viewModel.initialStateSelected()
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
