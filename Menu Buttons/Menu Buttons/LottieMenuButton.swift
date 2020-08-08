//
//  LottieMenuButton.swift
//  Menu Buttons
//
//  Created by Antoine on 07/08/2020.
//

import SwiftUI

struct LottieMenuButton: View {
    
    @Binding var showBackButton: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Capsule()//.fill(Color.red)
                    .frame(width: widthForCapsule1In(geo.size),
                        height: heightForCapsuleIn(geo.size))
                    .rotationEffect(angleForCapsule1)
                    .offset(offsetForCapsule1In(geo.size))
                    
                
                Capsule()//.fill(Color.blue)
                    .frame(width: widthForCapsule2In(geo.size),
                           height: heightForCapsuleIn(geo.size))
                    .rotationEffect(Angle(degrees: showBackButton ? 180 : 0))
                    //.zIndex(1000)
                
                Capsule()//.fill(Color.green)
                    .frame(width: widthForCapsule3In(geo.size),
                           height: heightForCapsuleIn(geo.size))
                    .rotationEffect(angleForCapsule3)
                    .offset(offsetForCapsule3In(geo.size))
                
                
            }
            .offset(y: (heightForCapsuleIn(geo.size) + yOffsetForRectangleIn(geo.size)) + (geo.size.height - (3 * heightForCapsuleIn(geo.size) + 2 * yOffsetForRectangleIn(geo.size))) / 2)
        }.scaleEffect(x: 0.9, y: 0.9, anchor: .center)
    }
    
    func heightForCapsuleIn(_ size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.15
    }
    
    func yOffsetForRectangleIn(_ size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.33
    }
    
    func widthForCapsule1In(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * (showBackButton ? 0.74 : 1)
    }
    
    func widthForCapsule2In(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func widthForCapsule3In(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * (showBackButton ? 0.74 : 1)
    }

    func offsetForCapsule1In(_ size: CGSize) -> CGSize {
        let width = min(size.width, size.height)
        if showBackButton {
            return CGSize(width: -width * 0.216, height: width * 0.21)
        }
        return CGSize(width: 0, height: -width * 0.33)
    }

    func offsetForCapsule3In(_ size: CGSize) -> CGSize {
        let width = min(size.width, size.height)
        if showBackButton {
            return CGSize(width: -width * 0.216, height: -width * 0.21)
        }
        return CGSize(width: 0, height: width * 0.33)
    }

    var angleForCapsule1: Angle {
        showBackButton ? Angle(degrees: -135) : Angle(degrees: 0)
    }

    var angleForCapsule3: Angle {
        showBackButton ? Angle(degrees: 135) : Angle(degrees: 0)
    }
    
}

