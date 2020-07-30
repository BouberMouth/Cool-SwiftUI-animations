//
//  DigitalClock24.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct DigitalClock24: View {
    
    @Binding var firstDigit: Int
    @Binding var secondDigit: Int
    @Binding var thirdDigit: Int
    @Binding var fourthDigit: Int
    
    var offColor: Color = Color(UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
    var onColor: Color = .black
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: geo.size.width * 0.02) {
                DigitalNumber(digit: self.$firstDigit, offColor: self.offColor, onColor: self.onColor)
                    .frame(width: geo.size.width * 0.88 / 4.5)
                DigitalNumber(digit: self.$secondDigit, offColor: self.offColor, onColor: self.onColor)
                    .frame(width: geo.size.width * 0.88  / 4.5)
                Colon(offColor: self.offColor, onColor: self.onColor)
                    .frame(width: geo.size.width * 0.88 / 9)
                DigitalNumber(digit: self.$thirdDigit, offColor: self.offColor, onColor: self.onColor)
                    .frame(width: geo.size.width * 0.88  / 4.5)
                DigitalNumber(digit: self.$fourthDigit, offColor: self.offColor, onColor: self.onColor)
                    .frame(width: geo.size.width * 0.88  / 4.5)
            }
            .offset(x: geo.size.width * 0.03)
        }
    }
}

extension DigitalClock24 {
    static func redDigitalClock24(firstDigit: Binding<Int>, secondDigit: Binding<Int>, thirdDigit: Binding<Int>, fourthDigit: Binding<Int>) -> DigitalClock24 {
        DigitalClock24(firstDigit: firstDigit, secondDigit: secondDigit, thirdDigit: thirdDigit, fourthDigit: fourthDigit, offColor: .darkRed, onColor: .red)
    }
    
    static func whiteDigitalClock24(firstDigit: Binding<Int>, secondDigit: Binding<Int>, thirdDigit: Binding<Int>, fourthDigit: Binding<Int>) -> DigitalClock24 {
        DigitalClock24(firstDigit: firstDigit, secondDigit: secondDigit, thirdDigit: thirdDigit, fourthDigit: fourthDigit)
    }
    
}
