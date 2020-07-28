//
//  ClockView.swift
//  Time Picker
//
//  Created by Antoine on 28/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    @Binding var seconds: Int
    
    let backgroundColor: Color
    let borderColor: Color
    let digitStyle: ClockDigitStyle
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(self.borderColor).frame(width: self.widthForBorderIn(geo.size))
                ClockFace(bgColor: self.backgroundColor, digitStyle: self.digitStyle)
                    .frame(width: self.widthForClockIn(geo.size))
                ClockHands(seconds: self.$seconds).frame(width: self.widthForClockIn(geo.size))
            }
        }
    }
    
    func widthForBorderIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func widthForClockIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.95
    }
}
