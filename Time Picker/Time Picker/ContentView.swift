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
    var hour: Int { seconds/3600 }
    var minutes: Int { seconds%3600/60 }

    var body: some View {
        VStack {
            ZStack {
                Circle().fill(Color.gray).frame(width: 300)
                ClockFace().frame(width: 280)
                ClockHands(seconds: $seconds).frame(width: 280)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
