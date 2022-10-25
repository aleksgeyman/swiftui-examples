//
//  ClockData.swift
//  SwiftUIExamples
//
//  Created by Aleksandar Geyman on 24.10.22.
//

import SwiftUI

struct ClockData {
    var hours: Int
    var minutes: Int
    var seconds: Double
    
    var asSeconds: Double {
        Double(hours * 3600 + minutes * 60) + seconds
    }
    
    var asString: String {
        String(format: "%2i", hours) + ":" + String(format: "%02i", minutes) + ":" + String(format: "%02.0f", seconds)
    }
    
    init(_ h: Int, _ m: Int, _ s: Double) {
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
    
    init(_ seconds: Double) {
        let h = Int(seconds) / 3600
        let m = (Int(seconds) - (h * 3600)) / 60
        let s = seconds - Double((h * 3600) + (m * 60))
        
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
}

extension ClockData: VectorArithmetic {
    var magnitudeSquared: Double {
        asSeconds * asSeconds
    }
    
    static var zero: ClockData {
        ClockData(0, 0, 0)
    }
    
    static func -= (lhs: inout ClockData, rhs: ClockData) {
        lhs = lhs - rhs
    }
    
    static func - (lhs: ClockData, rhs: ClockData) -> ClockData {
        ClockData(lhs.asSeconds - rhs.asSeconds)
    }
    
    static func += (lhs: inout ClockData, rhs: ClockData) {
        lhs = lhs + rhs
    }
    
    static func + (lhs: ClockData, rhs: ClockData) -> ClockData {
        ClockData(lhs.asSeconds + rhs.asSeconds)
    }
    
    mutating func scale(by rhs: Double) {
        var s = Double(self.asSeconds)
        s.scale(by: rhs)
        
        let ct = ClockData(s)
        self.hours = ct.hours
        self.minutes = ct.minutes
        self.seconds = ct.seconds
    }
}
