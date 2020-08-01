//
//  PulsingCapsules.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct PulsingCapsules: View {
    
    @State var indexOfAnimatedCapsule: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: spacingBetweenCapsulesIn(geo.size)) {
                ForEach(0..<9) { i in
                    Capsule().fill()
                        .frame(width: widthForCapsuleIn(geo.size),
                               height: widthForCapsuleIn(geo.size))
                        .offset(y: indexOfAnimatedCapsule == i ? -widthForCapsuleIn(geo.size)/2 : 0)
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                    withAnimation(.easeOut(duration: 1)) {
                        indexOfAnimatedCapsule = (indexOfAnimatedCapsule + 1) % 8
                    }
                }
            }
        }
    }
    
    func widthForCapsuleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * (0.65/8)
    }
    
    func spacingBetweenCapsulesIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
//    func offsetIn(_ size: CGSize) -> CGSize {
//        let halfDotsWidth = min(size.width, size.height) / 2
//        return CGSize(width: (size.width / 2) - halfDotsWidth,
//               height: (size.height / 2) - (widthForCapsuleIn(size) / 2))
//    }
}

