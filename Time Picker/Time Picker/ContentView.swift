//
//  ContentView.swift
//  Time Picker
//
//  Created by Antoine on 27/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var seconds: Int = 0
    @State var minutes: Int = 0
    @State var hours: Int = 0
    
    var body: some View {
        ZStack {
            ClockView()
            ClockHands(seconds: $seconds, intSeconds: seconds, minutes: $minutes, hours: $hours)
        }.frame(width: 300)
            .onTapGesture {
                print(self.seconds)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
