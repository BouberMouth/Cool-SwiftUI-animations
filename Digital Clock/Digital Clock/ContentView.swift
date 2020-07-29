//
//  ContentView.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 240 {
        didSet {
            if count > 1440 { count = 0 }
            var tmp = count
            firstDigit = tmp / 60 / 10
            secondDigit = tmp / 60 % 10
            tmp %= 60
            thirdDigit = tmp / 10
            fourthDigit = tmp % 10
        }
    }
    @State var firstDigit = 0
    @State var secondDigit = 0
    @State var thirdDigit = 0
    @State var fourthDigit = 0
    
    
    var body: some View {
    
        VStack {
            DigitalClock.whiteDigitalClock(firstDigit: $firstDigit, secondDigit: $secondDigit, thirdDigit: $thirdDigit, fourthDigit: $fourthDigit)
            DigitalClock.redDigitalClock(firstDigit: $firstDigit, secondDigit: $secondDigit, thirdDigit: $thirdDigit, fourthDigit: $fourthDigit)
            
        }
        
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (_) in
                withAnimation(.linear(duration: 0.1)) {
                    self.count += 1
                }
            }
        }
        
    }
}

extension Color {
    static let darkRed = Color(UIColor(displayP3Red: 0.1, green: 0, blue: 0, alpha: 1))
}
