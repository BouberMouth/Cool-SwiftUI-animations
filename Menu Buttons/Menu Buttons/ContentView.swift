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
                .background(Color.red)
                .aspectRatio(1/3, contentMode: .fit)
                .clipped()
                .animation(.linear)
                .onTapGesture {
                    showMenu.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
