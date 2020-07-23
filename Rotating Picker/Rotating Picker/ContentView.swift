//
//  ContentView.swift
//  Rotating Picker
//
//  Created by Antoine on 23/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    @State var hidePicker = true
    let icons = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "cloud.drizzle.fill", "cloud.snow.fill", "car.fill", "cloud.fill", "cloud.drizzle.fill", "cloud.snow.fill", "car.fill"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color(UIColor(red: 0.5, green: 0.8, blue: 1.00, alpha: 1.00)))
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.hidePicker = true
                    }
                }
            Image(systemName: icons[selection])
                .frame(minWidth: 100, maxWidth: .infinity)
                .frame(minHeight: 100, maxHeight: .infinity)
                .font(.system(size: 100))
                .foregroundColor(.white)
            RotatingPicker(icons: icons, selection: $selection, isHidden: $hidePicker)
                .offset(
                    x: hidePicker ? UIWindow().screen.bounds.width/2 + 50 : 0,
                    y: hidePicker ? UIWindow().screen.bounds.height/2 + 50 : UIWindow().screen.bounds.height/2
                )
                .padding()
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.hidePicker = false
                    }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
                .foregroundColor(Color(UIColor(red: 0.13, green: 0.27, blue: 1.00, alpha: 0.50)))
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



