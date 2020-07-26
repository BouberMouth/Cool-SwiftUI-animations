//
//  FillingCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct FillingCheckButton: View {
    @Binding var isChecked: Bool
    
    let diameter: CGFloat = 50.0
    let fontSize: CGFloat = 30.0
    
    var body: some View {
        ZStack {
            Circle().fill(isChecked ? Color.green : Color.red)
            Image(systemName: "checkmark")
                .font(.system(size: fontSize))
                .foregroundColor(.white)
            Circle().fill(Color(.systemBackground))
                .frame(width: self.isChecked ? 0 : diameter * 0.9)
        }.frame(width: diameter)
        .onTapGesture {
            withAnimation() {
                self.isChecked.toggle()
            }
        }
    }
}

