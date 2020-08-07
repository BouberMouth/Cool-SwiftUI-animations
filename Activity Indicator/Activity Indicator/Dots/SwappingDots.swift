//
//  BouncingDots.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct SwappingDots: View {
    
    @State var xOffsetOfDot0: CGFloat = 0
    @State var yOffsetOfDot0: CGFloat = 0
    @State var xOffsetOfOtherDots: CGFloat = 0
    
    var animationDuration: Int = 1

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: spacingBetweenDotsIn(geo.size)) {
                ForEach(0..<3) { i in
                    Circle().fill()
                        .frame(width: widthForDotIn(geo.size), height: widthForDotIn(geo.size))
                        .offset(offsetForDotAtIndex(i, in: geo.size))
                }
            }
            .offset(offsetIn(geo.size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: Double(animationDuration) * 1.2, repeats: true) { (_) in

                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: Double(animationDuration)/4)) {
                            xOffsetOfDot0 = 0
                            yOffsetOfDot0 = -(widthForDotIn(geo.size) + spacingBetweenDotsIn(geo.size))
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(animationDuration)/4 + 0.05) {
                        withAnimation(Animation.easeInOut(duration: Double(animationDuration)/2)) {
                            xOffsetOfDot0 = (widthForDotIn(geo.size) + spacingBetweenDotsIn(geo.size)) * 2
                            yOffsetOfDot0 = -(widthForDotIn(geo.size) + spacingBetweenDotsIn(geo.size))
                            
                            xOffsetOfOtherDots = -(widthForDotIn(geo.size) + spacingBetweenDotsIn(geo.size))
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(animationDuration) * 0.75 + 0.05) {
                        withAnimation(Animation.easeInOut(duration: Double(animationDuration)/4)) {
                            xOffsetOfDot0 = (widthForDotIn(geo.size) + spacingBetweenDotsIn(geo.size)) * 2
                            yOffsetOfDot0 = 0
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(animationDuration) + 0.05) {
                            xOffsetOfDot0 = 0
                            yOffsetOfDot0 = 0
                            xOffsetOfOtherDots = 0
                    }
                }
            }
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        min(size.width * 0.3, size.height / 2.05)
    }
    
    func spacingBetweenDotsIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
    func offsetForDotAtIndex(_ index: Int, in size: CGSize) -> CGSize {
        index == 0 ? CGSize(width: xOffsetOfDot0, height: yOffsetOfDot0) : CGSize(width: xOffsetOfOtherDots, height: 0)
    }
    
    func offsetIn(_ size: CGSize) -> CGSize {
        CGSize(width: (size.width / 2) - (1.5 * widthForDotIn(size) + spacingBetweenDotsIn(size)),
               height: (size.height - widthForDotIn(size))/2 + (widthForDotIn(size) + spacingBetweenDotsIn(size))/2)
    }
}

