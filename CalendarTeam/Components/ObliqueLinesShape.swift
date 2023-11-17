//
//  ObliqueLinesShape.swift
//  CalendarTeam
//
//  Created by DeveloperMB2020 on 16.11.2023.
//

import SwiftUI

struct ObliqueLines: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let lineWidth: CGFloat = 18
        
        let spacing = lineWidth
        
        for i in stride(from: -(rect.width * 2), through: rect.width * 2, by: spacing) {
            path.move(to: CGPoint(x: i, y: rect.minY))
            path.addLine(to: CGPoint(x: i + rect.height, y: rect.maxY))
        }
        
        return path
    }
}
