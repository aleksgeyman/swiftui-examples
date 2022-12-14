//
//  BasicPolygonShape.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.10.22.
//

import SwiftUI

struct BasicPolygonShape: Shape {
    let sides: Int
    
    func path(in rect: CGRect) -> Path {
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            if i == 0 {
                path.move(to: pt)
            } else {
                path.addLine(to: pt)
            }
        }
        
        path.closeSubpath()
        return path
    }
}
