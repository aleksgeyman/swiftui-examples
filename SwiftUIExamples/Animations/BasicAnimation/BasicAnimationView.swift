//
//  BasicAnimationView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.10.22.
//

import SwiftUI

struct BasicAnimationView: View, Identifiable, Example {
    let name = "Basic Animation"
    @State private var hasScaleEffect = true
    @State private var isOpaque = false
    
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .scaleEffect(hasScaleEffect ? 0.5 : 1)
            .opacity(isOpaque ? 1 : 0.2)
            .onTapGesture {
                withAnimation {
                    hasScaleEffect.toggle()
                    isOpaque.toggle()
                }
            }
        Spacer()
    }
}
