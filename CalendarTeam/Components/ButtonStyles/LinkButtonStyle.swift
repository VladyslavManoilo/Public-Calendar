//
//  LinkButtonStyle.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minHeight: 40)
            .foregroundColor(.appGrey900)
            .font(.appText)
            .underline()
            .contentShape(Rectangle())
    }
}
