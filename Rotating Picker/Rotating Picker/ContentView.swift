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
    let icons = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "cloud.drizzle.fill", "cloud.snow.fill", "moon.fill"]
    
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



