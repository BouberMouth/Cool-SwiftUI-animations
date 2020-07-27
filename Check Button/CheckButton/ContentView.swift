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
    
    var body: some View {
        VStack {
            SimpleCheckButton(isChecked: $isChecked1)
            FillingCheckButton(isChecked: $isChecked1)
            PieCheckButton(isChecked: $isChecked1)
            FlippingCheckButton(isChecked: $isChecked1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
