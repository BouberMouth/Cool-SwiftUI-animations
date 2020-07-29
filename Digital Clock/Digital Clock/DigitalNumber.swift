//
//  DigitalNumber.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct DigitalNumber: View {
    
    @Binding var digit: Int
    
    var offColor: Color = Color(UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
    var onColor: Color = .black
    
    var body: some View {
        GeometryReader { geo in
            return ZStack {
                //TOP
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .offset(x: 0, y: -geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //TOP LEFT
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //TOP RIGHT
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,1,2,3,4,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //MIDDLE
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width/6)
                    .foregroundColor([2,3,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM LEFT
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,2,6,8].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM RIGHT
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,1,3,4,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM
                Stroke().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .offset(x: 0, y: geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
            }
        }
    }
}
