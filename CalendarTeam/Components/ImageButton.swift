//
//  SwiftUIView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct ImageButton: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .padding(16)
            .background(Color.appSurfaceCard1)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.appDividerDefault, lineWidth: 1))
    
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(image: .appFilterIcon)
    }
}
