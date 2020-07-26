//
//  SimpleCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct SimpleCheckButton: View {
    @Binding var isChecked: Bool
    
    let diameter: CGFloat = 50.0
    let fontSize: CGFloat = 30.0
    
    var body: some View {
        ZStack {
            if isChecked {
                Circle().fill(Color.green)
                Circle().stroke(Color.green, lineWidth: 2.5)
                Image(systemName: "checkmark")
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
            } else {
                Circle().fill(Color(.systemBackground))
                Circle().stroke(Color.gray, lineWidth: 2.5)
            }
        }.frame(width: diameter)
        .onTapGesture {
            withAnimation() {
                self.isChecked.toggle()
            }
        }
    }
}

