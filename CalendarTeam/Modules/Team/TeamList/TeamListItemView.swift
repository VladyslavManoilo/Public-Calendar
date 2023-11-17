//
//  TeamListItemView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 16.11.2023.
//

import SwiftUI

struct TeamListItemView: View {
    let title: String
    let descripton: String
    let timeFrom: String?
    let timeTo: String?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.appHeadline)
                    .foregroundColor(.appGrey900)

                Spacer()
                
                if let timeFrom = timeFrom {
                    Text(timeFrom)
                        .font(.appFootnote)
                        .foregroundColor(.appGrey400)
                        .kerning(0.72)
                        .multilineTextAlignment(.trailing)
                    
                }
            }
            
            HStack {
                Text(descripton)
                    .font(.appBody)
                    .foregroundColor(.appGrey500)
                
                Spacer()
                
                if let timeTo = timeTo {
                    Text(timeTo)
                        .font(.appFootnote)
                        .foregroundColor(.appGrey400)
                        .kerning(0.72)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .padding(.vertical, 16)
    }
}

struct TeamListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListItemView(title: "Cuts and fades", descripton: "Mike M.", timeFrom: "8:00 AM", timeTo: "9:00 AM")
    }
}
