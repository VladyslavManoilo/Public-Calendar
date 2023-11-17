//
//  UserView.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

struct UserView: View {
    let imageURL: URL?
    let name: String
    let foregroundColor: Color?

    init(imageURL: URL?, name: String, foregroundColor: Color? = nil) {
        self.imageURL = imageURL
        self.name = name
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 8) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                
                Text(name)
                    .font(.appFootnote)
                    .foregroundColor(foregroundColor ?? .appTextOther)
            }

            Spacer()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/ru/c/c6/Jon_Snow_HBO.jpg"), name: "Jon", foregroundColor: nil)
    }
}
