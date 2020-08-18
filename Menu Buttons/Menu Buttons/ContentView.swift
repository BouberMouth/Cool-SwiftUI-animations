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
        HStack {
            VStack {
                LottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.blue)
                LottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.green)
                LottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.yellow)
                LottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.red)
            }
            
            VStack {
                SoftLottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.blue)
                SoftLottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.green)
                SoftLottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.yellow)
                SoftLottieMenuButton(showBackButton: $showMenu)
                    .animation(.linear)
                    .onTapGesture {
                        showMenu.toggle()
                    }
                    .foregroundColor(.red)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
