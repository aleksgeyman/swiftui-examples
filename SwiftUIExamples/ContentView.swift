//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.09.22.
//

import SwiftUI

struct ContentView: View {
    let examples: [String: [Example]] = ["Animations": animationExamples]
    private static let animationExamples: [Example] = [BasicAnimationView(),
                                                       BasicPolygonShapeView(),
                                                       AdvancedPolygonShapeView()]
    
    var body: some View {
        NavigationView {
            List(Array(examples.keys.sorted(by: <)), id: \.self) { key in
                Section(header: Text(verbatim: key)) {
                    ForEach(examples[key]!, id: \.id) { example in
                        NavigationLink(example.name) {
                            example.view
                                .navigationBarTitle("\(example.name)", displayMode: .inline)
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI Examples", displayMode: .large)
        }
    }
}
