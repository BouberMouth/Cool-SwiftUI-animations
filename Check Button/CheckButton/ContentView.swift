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
        VStack {
            SimpleCheckButton(isChecked: $isChecked1).padding()
            FillingCheckButton(isChecked: $isChecked1).padding()
            PieCheckButton(isChecked: $isChecked1).padding()
            FlippingCheckButton(isChecked: $isChecked1).padding()
            AssembledCheckButton(isChecked: $isChecked1).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
