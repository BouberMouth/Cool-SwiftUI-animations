//
//  ContentView.swift
//  Rotating Picker
//
//  Created by Antoine on 23/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RotatingPicker()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RotatingPicker: View {
    var rotation: Double = 0
    let icons = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "cloud.drizzle.fill", "cloud.snow.fill"]
    let diameter: CGFloat = 300
    let iconDiameter: CGFloat = 50
    let rotationFactor: Double = 360 / 5
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .frame(width: diameter, height: diameter)
            
            ForEach(0..<icons.count) { i in
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image(systemName: self.icons[i])
                }
                .frame(width: self.iconDiameter, height: self.iconDiameter)
                .offset(x: 0, y: -(self.diameter/2)+self.iconDiameter)
                .rotationEffect(Angle.degrees(Double(i) * self.rotationFactor))
            }
        }
        
        
    }
}
