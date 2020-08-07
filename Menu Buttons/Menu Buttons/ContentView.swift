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
        LottieMenuButton(showBackButton: $showMenu)
            .frame(width: 30, height: 30)
            .clipped()
            .animation(.linear)
            .onTapGesture {
                showMenu.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
