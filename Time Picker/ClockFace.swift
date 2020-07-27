//
//  TimePicker.swift
//  Time Picker
//
//  Created by Antoine on 27/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(Color.black)
                ForEach(0..<60, id: \.self) { i in
                    Capsule().fill(Color.white)
                        .frame(
                            width: i % 5 == 0 ? 4 : 2,
                            height: i % 5 == 0 ? 4 : 2)
                        .offset(self.offsetForDot(i, in: geo.size))
                        .rotationEffect(self.angleFor(i))
                    
                }
                ForEach(1...12, id: \.self) { i in
                    Text("\(i)")
                        .foregroundColor(.white)
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
}
