//
//  FlippingCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct FlippingCheckButton: View {
    @Binding var isChecked: Bool
    
    let diameter: CGFloat = 50.0
    let fontSize: CGFloat = 30.0

    init(isChecked: Binding<Bool>) {
        self._isChecked = isChecked
    }
    
    var body: some View {
        Button(action: {
            withAnimation() {
                self.isChecked.toggle()
            }
        }, label: {
            Circle().frame(width: diameter)
                .makeFlippingCheckButton(isFaceUp: isChecked)
        })
        .onAppear {
            UIButton.appearance()
        }
        
    }
}

struct Flipify: AnimatableModifier {
    
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        return rotation < 90.0
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue}
    }
    
    func body(content: Content) -> some View {
        
        ZStack {
            Group {
                Circle().fill(Color.green)
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }.opacity(isFaceUp ? 1 : 0)
            
            Group {
                Circle().fill(Color.red)
                Image(systemName: "xmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }.opacity(isFaceUp ? 0 : 1)
        }.frame(width: 50)
        .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
    }
}

extension View {
    func makeFlippingCheckButton(isFaceUp: Bool) -> some View {
        self.modifier(Flipify(isFaceUp: isFaceUp))
    }
}
