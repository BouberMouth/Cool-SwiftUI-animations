//
//  RotatingPicker.swift
//  Rotating Picker
//
//  Created by Antoine on 25/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct RotatingPicker: View {
    @Binding var isHidden: Bool
    @Binding var selection: Int
    let icons: [String]
    
    let diameter: CGFloat = 300
    let iconDiameter: CGFloat = 50
    let rotationFactor: Double
    @State var rotation: Double = 0
    
    init(icons: [String], selection: Binding<Int>, isHidden: Binding<Bool>) {
        self.icons = icons
        self.rotationFactor = 360 / Double(icons.count)
        self._selection = selection
        self._isHidden = isHidden
    }
    
    var body: some View {
        ZStack {
            Circle()
                //.foregroundColor(Color())
                .frame(width: diameter, height: diameter)
                .shadow(radius: 5)
            
            Image(systemName: "ellipsis")
                .foregroundColor(.white)
                .opacity(self.isHidden ? 1 : 0)
                .font(.system(size: self.iconDiameter/2))
                .offset(x: -self.diameter/3.8, y: -self.diameter/3.8)
            
            ForEach(0..<icons.count) { i in
                Button(action: {
                    self.selection = i
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(self.selection == i ? .lightGray : .white))
                            .shadow(radius: 2)
                        Image(systemName: self.icons[i])
                            .foregroundColor(.black)
                    }
                })
                .opacity(self.isHidden ? 0 : 1)
                .frame(width: self.iconDiameter, height: self.iconDiameter)
                .offset(x: 0, y: -(self.diameter/2)+self.iconDiameter)
                .rotationEffect(Angle.degrees(self.rotation + Double(i) * self.rotationFactor))
            }
        }.gesture(
            DragGesture()
                .onEnded({ gesture in
                    if !self.isHidden, abs(gesture.translation.width) > abs(gesture.translation.height) {
                        if gesture.translation.width > 0 {
                            withAnimation(.linear(duration: 0.2)) {
                                self.rotation += self.rotationFactor
                            }
                        } else {
                            withAnimation(.linear(duration: 0.2)) {
                                self.rotation -= self.rotationFactor
                            }
                        }
                    } else if gesture.translation.height > 20 {
                        withAnimation(.spring()) {
                            self.isHidden = true
                        }
                    }
                })
        )
    }
}
