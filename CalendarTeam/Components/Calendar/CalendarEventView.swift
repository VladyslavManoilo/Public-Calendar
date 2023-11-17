//
//  CalendarEventView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 16.11.2023.
//

import SwiftUI

struct CalendarEventView: View {
    let title: String
    let description: String
    let color: Color?

    var body: some View {
        ZStack {
            if let color = color {
                color
            } else {
                ObliqueLines()
                    .stroke(Color.appGrey100, lineWidth: 6)
            }
            
            VStack(spacing: 8) {
                Text(title)
                    .foregroundColor(.appMenuActive)
                    .font(.appSubhead)
                    .lineLimit(1)
                    .frame(minHeight: 20)

                Text(description)
                    .foregroundColor(.appMenuActive)
                    .font(.appCaption)
                    .fontWeight(.medium)
                    .lineLimit(1)

                Spacer()
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(8)
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView(title: "Mike M.", description: "Mid taper, Beard", color: .appAppointmentDone)
    }
}
