//
//  ContentView.swift
//  Time Picker
//
//  Created by Antoine on 27/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var seconds: Int = 10*3600 + 9*60 + 10
    var hours: Int { seconds / 3600 }
    var minutes: Int { (seconds % 3600) / 60 }
    
    init() {
        let sec = Calendar.current.component(.second, from: Date()).advanced(by: 1)
        let h = Calendar.current.component(.hour, from: Date())
        let min = Calendar.current.component(.minute, from: Date())
        self._seconds = State(initialValue: (h * 3600) + (min * 60) + sec)
    }

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ClockView(seconds: $seconds, backgroundColor: .white, borderColor: .black, digitStyle: .roman)
                        .foregroundColor(.black)
                    ClockView(seconds: $seconds, backgroundColor: .black, borderColor: .black, digitStyle: .arabic)
                        .foregroundColor(.white)
                    ClockView(seconds: $seconds, backgroundColor: .seaBlue, borderColor: .black, digitStyle: .devanagari)
                        .foregroundColor(.lightBlue)
                    ClockView(seconds: $seconds, backgroundColor: .orange, borderColor: .orange, digitStyle: .easternArabic)
                        .foregroundColor(.white)
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    static var seaBlue = Color(UIColor(red: 0.18, green: 0.34, blue: 0.91, alpha: 1.00))
    static var lightBlue = Color(UIColor(red: 0.68, green: 0.92, blue: 1.00, alpha: 1.00))
}
