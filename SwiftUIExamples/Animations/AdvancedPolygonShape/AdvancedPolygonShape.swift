//
//  AdvancedPolygonShape.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 24.10.22.
//

import SwiftUI

struct AdvancedPolygonShape: Shape {
    var sides: Int
    private var sidesAsDouble: Double
    var animatableData: Double {
        get { return sidesAsDouble }
        set { sidesAsDouble = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0
        
        for i in 0..<Int(sides) + extra {
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
    
    init(sides: Int) {
        self.sides = sides
        self.sidesAsDouble = Double(sides)
    }
}
