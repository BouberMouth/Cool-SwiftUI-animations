//
//  ContentView.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            SlalomingDot.embededSlalomingDot().aspectRatio(1/2, contentMode: .fit)
            SlalomingDot.embededSlalomingDot().aspectRatio(2, contentMode: .fit)
            BouncingDots().aspectRatio(1/2, contentMode: .fit)
            BouncingDots().aspectRatio(2, contentMode: .fit)
            PulsingCapsules(numberOfCapsules: 15).aspectRatio(1/2, contentMode: .fit)
            PulsingCapsules(numberOfCapsules: 15).aspectRatio(2, contentMode: .fit)
//            PulsingCapsules(numberOfCapsules: 3)
//            PulsingCapsules(numberOfCapsules: 6)
//            PulsingCapsules(numberOfCapsules: 9)
//            PulsingCapsules(numberOfCapsules: 12)
//            PulsingCapsules(numberOfCapsules: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
