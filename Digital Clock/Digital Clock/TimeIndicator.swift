//
//  TimeIndicator.swift
//  Digital Clock
//
//  Created by Antoine on 30/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct TimeIndicator: View {
    
    @Binding var isAM: Bool
    
    var offColor: Color
    var onColor: Color
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                Text("AM")
                    .foregroundColor(self.isAM ? self.onColor : self.offColor)
                    .offset(y: -geo.size.width)
                Text("PM")
                    .foregroundColor(self.isAM ? self.offColor : self.onColor)
                    .offset(y: geo.size.width)
            }
            .font(.system(size: self.fontSizeIn(geo.size), weight: .bold, design: .rounded))
            .offset(x: 0, y: geo.size.height / 2)
            .onTapGesture {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    withAnimation() {
                        self.isAM.toggle()
                    }
                }
            }
        }
    }
    
    func fontSizeIn(_ size: CGSize) -> CGFloat {
        size.width / 2
    }
}
