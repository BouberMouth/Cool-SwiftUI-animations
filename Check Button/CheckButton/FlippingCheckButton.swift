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

    init(isChecked: Binding<Bool>) {
        self._isChecked = isChecked
    }
    
    var body: some View {
        GeometryReader { geo in
            CustomButton(action: {
                withAnimation() {
                    self.isChecked.toggle()
                }
            }, label: {
                Circle().frame(width: self.widthForCircleIn(geo.size))
                    .makeFlippingCheckButton(isFaceUp: self.isChecked)
                    .font(.system(size: self.fontSizeIn(geo.size)))
            })
        }
    }
    
    func widthForCircleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func fontSizeIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
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
                    .foregroundColor(.white)
            }.opacity(isFaceUp ? 1 : 0)
            
            Group {
                Circle().fill(Color.red)
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
    }
}

extension View {
    func makeFlippingCheckButton(isFaceUp: Bool) -> some View {
        self.modifier(Flipify(isFaceUp: isFaceUp))
    }
}

struct CustomButton<Label>: View where Label: View {
    
    let action: () -> Void
    let label: () -> Label
    
    init(action: @escaping () -> Void, label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        makeBody()
            .onTapGesture {
                self.action()
        }
    }
    
    func makeBody() -> Label {
        label()
    }
}
