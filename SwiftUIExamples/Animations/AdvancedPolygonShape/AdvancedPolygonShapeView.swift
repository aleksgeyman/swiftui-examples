//
//  AdvancedPolygonShapeView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 24.10.22.
//

import SwiftUI

struct AdvancedPolygonShapeView: View, Identifiable, Example {
    let name = "Advanced Polygon Shape"
    @State private var sides: Int = 3
    
    var body: some View {
        AdvancedPolygonShape(sides: sides).stroke(Color.blue, lineWidth: 6)
            .scaleEffect(CGFloat(sides) * 0.05)
        Button {
            withAnimation {
                sides += 1
            }
        } label: {
            Text("Add Side")
        }
    }
}
