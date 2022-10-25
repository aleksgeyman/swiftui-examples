//
//  AnimatedAnalogClockView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 24.10.22.
//

import SwiftUI

struct AnimatedAnalogClockView: View, Identifiable, Example {
    let name = "Animated Analog Clock"
    @State private var time: ClockData = ClockData.zero
    
    var body: some View {
        
        Text(time.asString)
            .font(.title)
            .padding()
        AnalogClock(clockTime: time)
            .stroke(Color.accentColor, lineWidth: 3)
            .frame(maxWidth: 200, maxHeight: 200)
            .padding()
        HStack() {
            Button {
                withAnimation {
                    time = ClockData(time.asSeconds + 3600)
                }
            } label: {
                Text("Add One Hour")
            }
            Button {
                withAnimation {
                    time = ClockData(time.asSeconds + 60)
                }
            } label: {
                Text("Add One Minute")
            }
        }
        Spacer()
    }
}
