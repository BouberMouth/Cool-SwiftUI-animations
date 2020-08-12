//
//  ContentView.swift
//  Menu Buttons
//
//  Created by Antoine on 07/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        VStack {
            
            LottieMenuButton(showBackButton: $showMenu)
                .animation(.linear)
                .onTapGesture {
                    showMenu.toggle()
                }
            
            
            SoftLottieMenuButton(showBackButton: $showMenu)
                .animation(.linear)
                .onTapGesture {
                    showMenu.toggle()
                }
        }.frame(width: 50)
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
