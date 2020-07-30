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
            
            ZStack {
                //TOP
                Segment().fill().frame(width: self.hWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .offset(x: 0, y: -geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)

                //TOP LEFT
                Segment().fill().frame(width: self.vWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)

                //TOP RIGHT
                Segment().fill().frame(width: self.vWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: -geo.size.width*6/7/2)
                    .foregroundColor([0,1,2,3,4,7,8,9].contains(self.digit) ? self.onColor : self.offColor)

                //MIDDLE
                Segment().fill().frame(width: self.hWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .foregroundColor([2,3,4,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)

                //BOTTOM LEFT
                Segment().fill().frame(width: self.vWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: -geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,2,6,8].contains(self.digit) ? self.onColor : self.offColor)

                //BOTTOM RIGHT
                Segment().fill().frame(width: self.vWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .rotationEffect(Angle(degrees: 90))
                    .offset(x: geo.size.width*6/7/2, y: geo.size.width*6/7/2)
                    .foregroundColor([0,1,3,4,5,6,7,8,9].contains(self.digit) ? self.onColor : self.offColor)

                //BOTTOM
                Segment().fill().frame(width: self.hWidthIn(geo.size), height: self.heigthIn(geo.size))
                    .offset(x: 0, y: geo.size.width*6/7)
                    .foregroundColor([0,2,3,5,6,8,9].contains(self.digit) ? self.onColor : self.offColor)

            }.offset(y: geo.size.height / 2)
        }
    }
    
    func hWidthIn(_ size: CGSize) -> CGFloat {
        size.width*6/7
    }
    
    func vWidthIn(_ size: CGSize) -> CGFloat {
        size.width*6/7
    }
    
    func heigthIn(_ size: CGSize) -> CGFloat {
        size.width / 6
    }
    
    
}
