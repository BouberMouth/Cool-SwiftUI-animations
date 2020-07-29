//
//  ContentView.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isChecked1 = false
    @State var isChecked2 = false
    @State var isChecked3 = false
    @State var isChecked4 = false
    @State var isChecked5 = false
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                SimpleCheckButton(isChecked: $isChecked1).frame(minWidth: 100, maxWidth: 120).padding()
                FillingCheckButton(isChecked: $isChecked1).frame(minWidth: 100, maxWidth: 120).padding()
                PieCheckButton(isChecked: $isChecked1).frame(minWidth: 100, maxWidth: 120).padding()
                FlippingCheckButton(isChecked: $isChecked1).frame(minWidth: 100, maxWidth: 120).padding()
                AssembledCheckButton(isChecked: $isChecked1).frame(minWidth: 100, maxWidth: 120).padding()
            }.onTapGesture {
                withAnimation(.easeInOut(duration: 0.7)) {
                    self.isChecked1.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
