//
//  AssembledCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct AssembledCheckButton: View {
    
    @Binding var isChecked: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(self.isChecked ? Color.green : Color.red)
//                Circle().stroke(Color.gray, lineWidth: 1).frame(width: geo.size.width * 0.8)
                Capsule().fill(Color.white)
                    .frame(
                        width: self.widthForCapsule1In(geo.size),
                        height: self.heigthForCapsuleIn(geo.size))
                    .rotationEffect(self.angleForCapsule1)
                    .offset(self.offsetForCapsule1In(geo.size))
                Capsule().fill(Color.white)
                    .frame(
                        width: self.widthForCapsule2In(geo.size),
                        height: self.heigthForCapsuleIn(geo.size))
                    .rotationEffect(self.angleForCapsule2)
                    .offset(self.offsetForCapsule2In(geo.size))
            }
            .onTapGesture {
                    withAnimation() {
                        self.isChecked.toggle()
                    }
            }
        }
    }
    
    func widthForCapsule1In(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * (isChecked ? 0.32 : 0.65)
    }
    
    func widthForCapsule2In(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * (isChecked ? 0.58 : 0.65)
    }
    
    func heigthForCapsuleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
    func offsetForCapsule1In(_ size: CGSize) -> CGSize {
        let diameter = min(size.width, size.height)
        if isChecked {
            return CGSize(width: -diameter * 0.15, height: diameter * 0.105)
        }
        return .zero
    }
    
    func offsetForCapsule2In(_ size: CGSize) -> CGSize {
        let diameter = min(size.width, size.height)
        if isChecked {
            return CGSize(width: diameter * 0.08, height: diameter *  -0.01)
        }
        return .zero
    }
    
    var angleForCapsule1: Angle {
        isChecked ? Angle(degrees: 52) : Angle(degrees: -45)
    }
    
    var angleForCapsule2: Angle {
        isChecked ? Angle(degrees: -58) : Angle(degrees: 45)
    }
}


