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
            ZStack {
                Circle().fill(self.isOn ? self.onColor : self.offColor).frame(width: geo.size.width/3)
                    .offset(y: geo.size.width)
                Circle().fill(self.isOn ? self.onColor : self.offColor).frame(width: geo.size.width/3)
                    .offset(y: -geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.width * 4)
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
