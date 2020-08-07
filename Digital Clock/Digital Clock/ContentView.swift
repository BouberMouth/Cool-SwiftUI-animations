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
    
    @State var seconds1 = 1430 {
        didSet {
            if seconds1 == 1440 { seconds1 = 0 }
            var tmp = seconds1
            firstDigit1 = tmp / 60 / 10
            secondDigit1 = tmp / 60 % 10
            tmp %= 60
            thirdDigit1 = tmp / 10
            fourthDigit1 = tmp % 10
        }
    }
    
    
    // SECOND CLOCK (24)
    @State var firstDigit2 = 0
    @State var secondDigit2 = 0
    @State var thirdDigit2 = 0
    @State var fourthDigit2 = 0
    @State var isAM: Bool = false
    
    @State var seconds2 = 1000 {
        didSet {
            if seconds2 == 1440 { seconds2 = 0 }
            var tmp = seconds2
            firstDigit2 = tmp / 60 / 10
            secondDigit2 = tmp / 60 % 10
            tmp %= 60
            thirdDigit2 = tmp / 10
            fourthDigit2 = tmp % 10
        }
    }
    
    
    // THIRD CLOCK (24)
    @State var firstDigit3 = 0
    @State var secondDigit3 = 0
    @State var thirdDigit3 = 0
    @State var fourthDigit3 = 0
    
    @State var seconds3 = 200 {
        didSet {
            if seconds3 == 1440 { seconds3 = 0 }
            var tmp = seconds3
            firstDigit3 = tmp / 60 / 10
            secondDigit3 = tmp / 60 % 10
            tmp %= 60
            thirdDigit3 = tmp / 10
            fourthDigit3 = tmp % 10
        }
    }
    
    
    // FOURTH CLOCK (24)
    @State var firstDigit4 = 0
    @State var secondDigit4 = 0
    @State var thirdDigit4 = 0
    @State var fourthDigit4 = 0
    
    @State var seconds4 = 457 {
        didSet {
            if seconds4 == 1440 { seconds4 = 0}
            var tmp = seconds4
            firstDigit4 = tmp / 60 / 10
            secondDigit4 = tmp / 60 % 10
            tmp %= 60
            thirdDigit4 = tmp / 10
            fourthDigit4 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit5 = 0
    @State var secondDigit5 = 0
    @State var thirdDigit5 = 0
    @State var fourthDigit5 = 0
    
    @State var seconds5 = 0 {
        didSet {
            if seconds5 == 1440 { seconds5 = 0}
            var tmp = seconds5
            firstDigit5 = tmp / 60 / 10
            secondDigit5 = tmp / 60 % 10
            tmp %= 60
            thirdDigit5 = tmp / 10
            fourthDigit5 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit6 = 0
    @State var secondDigit6 = 0
    @State var thirdDigit6 = 0
    @State var fourthDigit6 = 0
    
    @State var seconds6 = 978 {
        didSet {
            if seconds6 == 1440 { seconds6 = 0}
            var tmp = seconds6
            firstDigit6 = tmp / 60 / 10
            secondDigit6 = tmp / 60 % 10
            tmp %= 60
            thirdDigit6 = tmp / 10
            fourthDigit6 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit7 = 0
    @State var secondDigit7 = 0
    @State var thirdDigit7 = 0
    @State var fourthDigit7 = 0
    
    @State var seconds7 = 720 {
        didSet {
            if seconds7 == 1440 { seconds6 = 0}
            var tmp = seconds7
            firstDigit7 = tmp / 60 / 10
            secondDigit7 = tmp / 60 % 10
            tmp %= 60
            thirdDigit7 = tmp / 10
            fourthDigit7 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit8 = 0
    @State var secondDigit8 = 0
    @State var thirdDigit8 = 0
    @State var fourthDigit8 = 0
    
    @State var seconds8 = 139 {
        didSet {
            if seconds8 == 1440 { seconds8 = 0 }
            var tmp = seconds8
            firstDigit8 = tmp / 60 / 10
            secondDigit8 = tmp / 60 % 10
            tmp %= 60
            thirdDigit8 = tmp / 10
            fourthDigit8 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit9 = 0
    @State var secondDigit9 = 0
    @State var thirdDigit9 = 0
    @State var fourthDigit9 = 0
    
    @State var seconds9 = 15 {
        didSet {
            if seconds9 == 1440 { seconds9 = 0}
            var tmp = seconds9
            firstDigit9 = tmp / 60 / 10
            secondDigit9 = tmp / 60 % 10
            tmp %= 60
            thirdDigit9 = tmp / 10
            fourthDigit9 = tmp % 10
        }
    }
    
    // FOURTH CLOCK (24)
    @State var firstDigit10 = 0
    @State var secondDigit10 = 0
    @State var thirdDigit10 = 0
    @State var fourthDigit10 = 0
    
    @State var seconds10 = 675 {
        didSet {
            if seconds10 == 1440 { seconds10 = 0 }
            var tmp = seconds10
            firstDigit10 = tmp / 60 / 10
            secondDigit10 = tmp / 60 % 10
            tmp %= 60
            thirdDigit10 = tmp / 10
            fourthDigit10 = tmp % 10
        }
    }
    
    
    var body: some View {
    
        HStack(spacing: 0) {
                
            VStack {
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit1, secondDigit: $secondDigit1, thirdDigit: $thirdDigit1, fourthDigit: $fourthDigit1)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit2, secondDigit: $secondDigit2, thirdDigit: $thirdDigit2, fourthDigit: $fourthDigit2)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit3, secondDigit: $secondDigit3, thirdDigit: $thirdDigit3, fourthDigit: $fourthDigit3)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit4, secondDigit: $secondDigit4, thirdDigit: $thirdDigit4, fourthDigit: $fourthDigit4)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit5, secondDigit: $secondDigit5, thirdDigit: $thirdDigit5, fourthDigit: $fourthDigit5)
                    .padding(20)
            }
            
            VStack {
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit6, secondDigit: $secondDigit6, thirdDigit: $thirdDigit6, fourthDigit: $fourthDigit6)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit7, secondDigit: $secondDigit7, thirdDigit: $thirdDigit7, fourthDigit: $fourthDigit7)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit8, secondDigit: $secondDigit8, thirdDigit: $thirdDigit8, fourthDigit: $fourthDigit8)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit9, secondDigit: $secondDigit9, thirdDigit: $thirdDigit9, fourthDigit: $fourthDigit9)
                    .padding(20)
                
                DigitalClock24.whiteDigitalClock24(firstDigit: $firstDigit10, secondDigit: $secondDigit10, thirdDigit: $thirdDigit10, fourthDigit: $fourthDigit10)
                    .padding(20)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
                withAnimation(.linear(duration: 0.1)) {
                    self.seconds1 += 1 - 1
                    self.seconds2 += 1 - 1
                    self.seconds3 += 1 - 1
                    self.seconds4 += 1 - 1
                    self.seconds5 += 1 - 1
                    self.seconds6 += 1 - 1
                    self.seconds7 += 1 - 1
                    self.seconds8 += 1 - 1
                    self.seconds9 += 1 - 1
                    self.seconds10 += 1 - 1
                    
                }
            }
        }
        
    }
}

extension Color {
    static let darkRed = Color(UIColor(displayP3Red: 0.12, green: 0, blue: 0, alpha: 1))
}

