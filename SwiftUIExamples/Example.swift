//
//  Example.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 21.10.22.
//

import SwiftUI

protocol Example {
    var id: UUID { get }
    var name: String { get }
    var view: AnyView { get }
}

extension Example where Self: View {
    var view: AnyView { AnyView(self) }
}

extension Example where Self: Identifiable {
    var id: UUID { UUID() }
}
