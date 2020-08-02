//
//  BouncingDots.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct BouncingDots: View {
    
    @State var indexOfAnimatedDot: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: spacingBetweenDotsIn(geo.size)) {
                ForEach(0..<3) { i in
                    Circle().fill()
                        .frame(width: widthForDotIn(geo.size), height: widthForDotIn(geo.size))
                        .offset(y: indexOfAnimatedDot == i ? -widthForDotIn(geo.size)/2 : 0)
                }
            }
            .offset(offsetIn(geo.size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.5/4, repeats: true) { (_) in
                    withAnimation(.easeOut(duration: 1.5/4)) {
                        indexOfAnimatedDot = (indexOfAnimatedDot + 1) % 4
                    }
                }
            }
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        min(size.width * 0.3, size.height / 1.5)
    }
    
    func spacingBetweenDotsIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
    func offsetIn(_ size: CGSize) -> CGSize {
        CGSize(width: (size.width / 2) - (1.5 * widthForDotIn(size) + spacingBetweenDotsIn(size)),
               height: (size.height / 2) - (widthForDotIn(size) / 4))
    }
}

