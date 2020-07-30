//
//  Colon.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct Colon: View {
    
    
    @State var isOn: Bool = true
    
    var offColor: Color
    var onColor: Color
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                Circle().fill(self.isOn ? self.onColor : self.offColor)
                    .frame(width: geo.size.width/3, height: geo.size.width/3)
                    .offset(y: geo.size.width)
                Circle().fill(self.isOn ? self.onColor : self.offColor)
                    .frame(width: geo.size.width/3, height: geo.size.width/3)
                    .offset(y: -geo.size.width)
            }
            .offset(x: geo.size.width / 4, y: geo.size.height / 2)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                    withAnimation() {
                        self.isOn.toggle()
                    }
                }
            }
        }
    }
}
