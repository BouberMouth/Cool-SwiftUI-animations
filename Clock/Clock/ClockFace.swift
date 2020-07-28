//
//  ClockFace.swift
//  Time Picker
//
//  Created by Antoine on 27/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ClockFace: View {
    
    var bgColor: Color
    var digitStyle: ClockDigitStyle
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(self.bgColor)
                ForEach(0..<60, id: \.self) { i in
                    Capsule().fill()
                        .frame(
                            width: i % 5 == 0 ? 4 : 2,
                            height: i % 5 == 0 ? 4 : 2)
                        .offset(self.offsetForDot(i, in: geo.size))
                        .rotationEffect(self.angleFor(i))
                    
                }
                ForEach(1...12, id: \.self) { i in
                    Text(self.textForDigit(i))
                        //.foregroundColor(.white)
                        .font(.system(size: self.fontFor(geo.size)))
                        .offset(self.offsetForDigit(i, in: geo.size))
                }
                
            }
        }
    }
    
    func fontFor(_ size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.1
    }
    
    func angleFor(_ i: Int) -> Angle {
        Angle.degrees(6 * Double(i))
    }
    
    func offsetForDot(_ i: Int, in size: CGSize) -> CGSize {
        let radius = min(size.width, size.height) / 2
        return CGSize(
            width: 0,
            height: i % 5 == 0 ? radius - 4 : radius - 2)
    }
    
    func offsetForDigit(_ i: Int, in size: CGSize) -> CGSize {
        var radius = min(size.width, size.height)
        radius = (radius / 2) - 4 - fontFor(size)
        
        switch i {
        case 1:
            return CGSize(width: radius/2, height: -radius * sqrt(3)/2)
        case 2:
            return CGSize(width: radius * sqrt(3)/2, height: -radius/2)
        case 3:
            return CGSize(width: radius, height: 0)
        case 4:
            return CGSize(width: radius * sqrt(3)/2, height: radius/2)
        case 5:
            return CGSize(width: radius/2, height: radius * sqrt(3)/2)
        case 6:
            return CGSize(width: 0, height: radius)
        case 7:
            return CGSize(width: -radius/2, height: radius * sqrt(3)/2)
        case 8:
            return CGSize(width: -radius * sqrt(3)/2, height: radius/2)
        case 9:
            return CGSize(width: -radius, height: 0)
        case 10:
            return CGSize(width: -radius * sqrt(3)/2, height: -radius/2)
        case 11:
            return CGSize(width: -radius/2, height: -radius * sqrt(3)/2)
        default:
            return CGSize(width: 0, height: -radius)
        
        }
    }
    
    func textForDigit(_ i: Int) -> String {
        let romanNumbers = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII"]
        let devangariNumbers = ["१", "२", "३", "४", "५", "६", "७", "८", "९", "१०", "११", "१२"]
        let easternArabicNumbers = [1: "١", 2: "٢", 3: "٣", 4: "٤", 5: "٥", 6: "٦", 7: "٧", 8: "٨", 9: "٩", 10: "١٠", 11: "١١", 12: "١٢"]
        switch digitStyle {
        case .arabic:
            return "\(i)"
        case .roman:
            return romanNumbers[i-1]
        case .devanagari:
            return devangariNumbers[i-1]
        case .easternArabic:
            return easternArabicNumbers[i] ?? "\(i)"
        }
    }
}


enum ClockDigitStyle {
    case roman
    case arabic
    case devanagari
    case easternArabic
}
