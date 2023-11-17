//
//  WaitlistView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct WaitlistView: View {
    let waitlistValue: Int
    var onShowTap: VoidClosure?
    
    var body: some View {
        VStack {
            HStack {
                Text("Waitlist")
                    .font(.appBody)
                    .foregroundColor(.appGrey500)
                    .frame(minHeight: 40)
                
                Text("\(waitlistValue)")
                    .font(.appBody)
                    .foregroundColor(.appWhite)
                    .padding(.top, 2)
                    .frame(minWidth: 20, maxHeight: 20)
                    .background(Color.appGrey900)
                    .clipShape(Capsule())
                
                Spacer()
                
                Button {
                    onShowTap?()
                } label: {
                    Text("Show")
                }
                .buttonStyle(LinkButtonStyle())
            }
        }
    }
}

struct WaitlistView_Previews: PreviewProvider {
    static var previews: some View {
        WaitlistView(waitlistValue: 7)
    }
}
