//
//  ContentView.swift
//  Tab Bar
//
//  Created by Antoine on 12/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Color.red.tabItem {
                Image(systemName: "car")
            }
            Color.blue.tabItem {
                Image(systemName: "car.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
