//
//  Font+Custom.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 15.11.2023.
//

import SwiftUI

extension Font {
    static var appTitle: Font {
        return Font.custom("GT Walsheim Pro", size: 40).weight(.medium)
    }

    static var appTitleLight: Font {
        return Font.custom("GT Walsheim Pro", size: 40).weight(.light)
    }
    
    static var appHeadline: Font {
        return Font.custom("GT Walsheim Pro", size: 16).weight(.medium)
    }
    
    static var appBody: Font {
        return Font.custom("GT Walsheim Pro", size: 14)
    }

    static var appText: Font {
        return Font.custom("Plus Jakarta Sans", size: 12).weight(.medium)
    }
    
    static var appCallout: Font {
        return Font.custom("GT Walsheim Pro", size: 12)
    }
    
    static var appSubhead: Font {
        return Font.custom("GT Walsheim Pro", size: 12).weight(.medium)
    }
    
    static var appFootnote: Font {
        return Font.custom("GT Walsheim Pro", size: 12)
    }

    static var appCaption: Font {
        return Font.custom("GT Walsheim Pro", size: 10)
    }
}
