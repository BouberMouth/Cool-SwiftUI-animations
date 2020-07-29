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
    
    var offColor: Color
    var onColor: Color
    
    var body: some View {
        GeometryReader { geo in
            return ZStack {
                //TOP
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .offset(x: 0, y: -geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //TOP LEFT
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //TOP RIGHT
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,1,2,3,4,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //MIDDLE
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width/6)
                    .foregroundColor([2,3,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM LEFT
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,2,6,8].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM RIGHT
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,1,3,4,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
                //BOTTOM
                Segment().fill().frame(width: geo.size.width*6/7, height: geo.size.width / 6)
                    .offset(x: 0, y: geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)
                
            }
        }
    }
}
