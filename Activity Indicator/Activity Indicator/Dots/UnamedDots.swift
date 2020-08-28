//
//  BouncingDots.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct UnamedDots: View {
    
    @State var indexOfAnimatedDot: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle().opacity(0)
                ZStack() {
                    ForEach(0..<3) { i in
                        Circle().fill()
                            .frame(width: indexOfAnimatedDot == i ? widthForDotIn(geo.size) : 0,
                                    height: indexOfAnimatedDot == i ? widthForDotIn(geo.size) : 0)
                            .offset(offsetForDotAtindex(i, in: geo.size))
                    }
                }
                //.offset(offsetIn(geo.size))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1.5/4, repeats: true) { (_) in
                        withAnimation(.easeOut(duration: 1.5/4 * 3)) {
                            indexOfAnimatedDot = (indexOfAnimatedDot + 1) % 4
                        }
                    }
                }
            }
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        print(size)
        print(min(size.width * 0.3, size.height / 1.5))
        return min(size.width * 0.3, size.height / 1.5)
        
    }
    
    func spacingBetweenDotsIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
    func offsetForDotAtindex(_ index: Int, in size: CGSize) -> CGSize {
        if index == 1 {
            return CGSize.zero
        } else if index == 2 {
            return CGSize(width: widthForDotIn(size) + spacingBetweenDotsIn(size),
                   height: 0)
        } else {
            return CGSize(width: -widthForDotIn(size) - spacingBetweenDotsIn(size),
                   height: 0)
        }
    }
    
    func offsetIn(_ size: CGSize) -> CGSize {
        CGSize(width: (size.width / 2) - (1.5 * widthForDotIn(size) + spacingBetweenDotsIn(size)),
               height: (size.height / 2) - (widthForDotIn(size) / 4))
    }
}

