//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.09.22.
//

import SwiftUI

struct ContentView: View {
    let examples = ["Animations": ["First Example", "Second Example", "Third Example"],
                    "Second Example": ["First", "Second", "Third"]]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(examples.keys.sorted(by: <)), id: \.self) { key in
                    Section(header: Text(verbatim: key)) {
                        ForEach(examples[key]!, id: \.self) { value in
                            NavigationLink(value) {
                                // TODO:
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI Examples", displayMode: .large)
        }
    }
}
