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
    @State var hasChangedSelection = false
    @State var hidePicker = true
    let icons = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "cloud.drizzle.fill", "cloud.snow.fill", "moon.fill"]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(lightBlue))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.hidePicker = true
                        }
                    }
                Image(systemName: icons[selection])
                    .frame(width: widthIn(geo.size))
                    .frame(height: widthIn(geo.size))
                    .font(.system(size: widthIn(geo.size)))
                    .foregroundColor(.white)
                    .offset(y: hasChangedSelection ? geo.size.height : 0)
                RotatingPicker(icons: icons, selection: $selection, isHidden: $hidePicker, hasChangedSelection: $hasChangedSelection)
                    .offset(
                        x: hidePicker ? geo.size.width/1.7 : 0,
                        y: hidePicker ? geo.size.height/1.7 : geo.size.height/1.9
                    )
                    .padding()
                    .foregroundColor(Color(oceanBlue))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.hidePicker = false
                        }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
    func widthIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2
    }

    
    //MARK: - Drawing constants
    let lightBlue = UIColor(red: 0.5, green: 0.8, blue: 1.00, alpha: 1.00)
    let oceanBlue = UIColor(red: 0.31, green: 0.47, blue: 0.88, alpha: 1.00)
}
