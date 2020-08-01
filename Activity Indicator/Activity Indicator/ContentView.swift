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
            SlalomingDot.embededSlalomingDot()
            BouncingDots()
            PulsingCapsules(numberOfCapsules: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
