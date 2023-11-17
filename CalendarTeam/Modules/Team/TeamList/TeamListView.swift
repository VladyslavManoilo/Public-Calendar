//
//  TeamListView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct TeamListView: View {
    @ObservedObject var viewModel: TeamListViewModel
    
    init(teamMembers: [TeamMember]) {
        viewModel = TeamListViewModel(teamMembers: teamMembers)
    }
    
    var body: some View {
        VStack(spacing: 23) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.teamMembers, id: \.id) { member in
                        ZStack {
                            UserView(imageURL: member.avatarURL, name: member.name, foregroundColor: viewModel.isMemberSelected(member) ? Color.appWhite : Color.appGrey900)
                                .padding(8)
                        }
                        .background(viewModel.isMemberSelected(member) ? Color.appGrey900 : Color.appWhite)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.appDividerDefault, lineWidth: 1))
                        .onTapGesture {
                            viewModel.memberChanged(toMember: member)
                        }

                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
            }
            .frame(height: 48)
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(viewModel.sections, id: \.title) { section in
                        HStack {
                            Text(section.title)
                                .foregroundColor(.appGrey400)
                                .font(.appCallout)
                                .kerning(2.6)
                            
                            Spacer()
                        }
                        .padding(.top, section.title == viewModel.sections.first?.title ? 0 : 32)
                        
                        ForEach(section.appointments, id: \.id) { appointment in
                            VStack {
                                HStack {
                                    TeamListItemView(title: appointment.services, descripton: appointment.clientName, timeFrom: appointment.date.formatted(.dateTime.hour().minute()), timeTo: appointment.date.hourAfter?.formatted(.dateTime.hour().minute()))
                                }
                                
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView(teamMembers: MockDataGenerator.generateTeam().members)
    }
}
