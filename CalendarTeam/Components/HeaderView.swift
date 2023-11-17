//
//  HeaderView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct HeaderView: View {
    let title: AttributedString
    @Binding var isListSelected: Bool

    var body: some View {
        VStack {
            HStack {
                Text(title)
                
                Spacer()

                HStack(spacing: 8) {
                    Image.appListIcon
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                        .foregroundColor(isListSelected ? .appWhite : .appGrey900)
                        .background(isListSelected ? Color.appGrey900 : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            isListSelected.toggle()
                        }
                    
                    Image.appNotificationIcon
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                }
                .frame(height: 40)
            }
            .frame(minHeight: 48)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: AttributedString("Mon Jul 6"), isListSelected: .constant(false))
    }
}
