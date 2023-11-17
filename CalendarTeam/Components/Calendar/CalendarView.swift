//
//  CalendarView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct CalendarView: View {
    private let viewModel: CalendarViewModel
    private let currentDateViewId = "currentDateViewId"
    
    init(selectedDate: Date, users: [CalendarUser]) {
        viewModel = CalendarViewModel(selectedDate: selectedDate, users: users)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ForEach(viewModel.users, id: \.id) { user in
                        UserView(imageURL: user.avatarURL, name: user.name)
                            .padding(.leading, 8)
                            .frame(maxWidth: .infinity)
                        
                        
                        if user.id != viewModel.users.last?.id {
                            Divider()
                        }
                    }
                }
                .frame(height: 56)
                
                Divider()
            }
            .padding(.leading, 80)
            .padding(.trailing, 11)
            
            ScrollViewReader { reader in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.timesheet, id: \.self) { date in
                            if date.includes(date: Date.now) {
                                calendarRow(withDate: date)
                                    .id(currentDateViewId)
                            } else {
                                calendarRow(withDate: date)
                            }
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 11)
                }
                .onAppear {
                    reader.scrollTo(currentDateViewId, anchor: .center)
                }
            }
        }
    }

    func calendarRow(withDate date: Date) -> some View {
        ZStack(alignment: .top) {
            HStack(alignment: .top, spacing: 0) {
                HStack {
                    Text(date.cleanTimeStirng)
                        .foregroundColor(.appCalendarTime)
                        .font(.appFootnote)
                        .kerning(0.72)
                    
                    Spacer()
                }
                .frame(width: 56)
                
                ForEach(viewModel.users, id: \.id) { user in
                    VStack(spacing: 0) {
                        // TODO: add overlaping rules
                        if viewModel.activeEvents(user.events, for: date).isEmpty {
                            Spacer()
                        } else {
                            ForEach(viewModel.activeEvents(user.events, for: date), id: \.id) { event in
                                CalendarEventView(title: event.title, description: event.description, color: event.color)
                            }
                        }
                        
                        Divider()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 95)
                    
                    if user.id != viewModel.users.last?.id {
                        Divider()
                    }
                }
            }
            
            GeometryReader { geometry in
                if date.includes(date: Date.now) {
                    VStack {
                        HStack(spacing: 0) {
                            HStack {
                                Text(Date.now.cleanTimeStirng)
                                    .foregroundColor(.appBorderError)
                                    .font(.appFootnote)
                                    .kerning(0.72)
                                    
                                
                                Spacer()
                            }
                            .frame(width: 56)
                            
                            Circle()
                                .fill(Color.appBorderError)
                                .frame(width: 7, height: 7)
                            
                            Rectangle()
                                .fill(Color.appBorderError)
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                        .offset(y: geometry.size.height / 60 * CGFloat(Date.now.minute))
                        
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: Date.now, users: MockDataGenerator.generateTeam().members)
    }
}
