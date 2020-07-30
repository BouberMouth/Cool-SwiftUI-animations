//
//  ContentView.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // FIRST CLOCK (24)
    @State var firstDigit1 = 0
    @State var secondDigit1 = 0
    @State var thirdDigit1 = 0
    @State var fourthDigit1 = 0
    
    @State var seconds1 = 690 {
        didSet {
            if seconds1 > 1440 { seconds1 = 0 }
            var tmp = seconds1
            firstDigit1 = tmp / 60 / 10
            secondDigit1 = tmp / 60 % 10
            tmp %= 60
            thirdDigit1 = tmp / 10
            fourthDigit1 = tmp % 10
        }
    }
    
    
    // SECOND CLOCK (12)
    @State var firstDigit2 = 0
    @State var secondDigit2 = 0
    @State var thirdDigit2 = 0
    @State var fourthDigit2 = 0
    @State var isAM: Bool = true
    
    @State var seconds2 = 690 {
        didSet {
            if seconds2 == 720 { isAM = false }
            if seconds2 > 1440 { seconds2 = 0 }
            var tmp = seconds2
            firstDigit2 = tmp / 60 % 12 / 10
            secondDigit2 = tmp / 60 % 12 % 10
            if firstDigit2 == 0 && secondDigit2 == 0 {
                firstDigit2 = 1
                secondDigit2 = 2
            }
            tmp %= 60
            thirdDigit2 = tmp / 10
            fourthDigit2 = tmp % 10
        }
    }
    
    
    
    var body: some View {
    
        VStack(spacing: 0) {
            ZStack {
                Rectangle().fill(Color.white)
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit1, secondDigit: $secondDigit1, thirdDigit: $thirdDigit1, fourthDigit: $fourthDigit1).frame(width: 280)
            }
            ZStack {
                Rectangle().fill(Color.black)
                DigitalClock12.redDigitalClock12(isAM: $isAM, firstDigit: $firstDigit2, secondDigit: $secondDigit2, thirdDigit: $thirdDigit2, fourthDigit: $fourthDigit2).frame(width: 300)
            }
        }.edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                withAnimation(.linear(duration: 0.1)) {
                    self.seconds1 += 1
                    self.seconds2 += 1
                }
            }
        }
        
    }
}

extension Color {
    static let darkRed = Color(UIColor(displayP3Red: 0.12, green: 0, blue: 0, alpha: 1))
}

