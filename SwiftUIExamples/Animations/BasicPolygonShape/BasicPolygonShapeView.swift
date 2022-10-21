//
//  BasicPolygonShapeView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.10.22.
//

import SwiftUI

struct BasicPolygonShapeView: View, Identifiable, Example {
    let name = "Basic Polygon Shape"
    @State private var sides: Int = 3
    
    var body: some View {
        BasicPolygonShape(sides: sides).stroke(Color.blue, lineWidth: 6)
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
