//
//  CapsulePicker.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct CapsulePicker: View {
    let source: [String]
    let selectedIndex: Int
    var onSelect: ((Int) -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(source, id: \.self) { item in
                Text(item)
                    .foregroundColor(itemSelected(item) ? .appGrey100 : .appTextBody)
                    .font(.appBody)
                    .padding(.horizontal, itemSelected(item) ? 16 : 0)
                    .padding(.vertical, 12)
                    .background(itemSelected(item) ? Color.appSurfaceAction : Color.clear)
                    .clipShape(Capsule())
                    .contentShape(Capsule())
                    .frame(maxWidth: .infinity)
                    .frame(minWidth: itemSelected(item) ? 76 : 0)
                    .onTapGesture {
                        if let currentIndex = source.firstIndex(of: item),
                                          selectedIndex != currentIndex {
                                           onSelect?(currentIndex)
                                       }
                    }
            }
        }
        .padding(.horizontal, 12)
        .background(Color.appSurfacePage)
        .clipShape(Capsule())
        .overlay(Capsule()
            .stroke(Color.appDividerDefault, lineWidth: 1))
    }

    func itemSelected(_ item: String) -> Bool {
        return selectedIndex == source.firstIndex(of: item)
    }
}

struct CapsulePicker_Previews: PreviewProvider {
    static var previews: some View {
        CapsulePicker(source: ["Sun 5", "Mon 6", "Tue 7"], selectedIndex: 1, onSelect: nil)
    }
}
