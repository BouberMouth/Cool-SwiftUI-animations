//
//  BouncingDots.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct UnamedDots: View {
    
    @State var animationCounter: Int = 0
    @State var animate0: Bool = false
    @State var animate1: Bool = false
    @State var animate2: Bool = false
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle().opacity(0)
                ZStack() {
                    
                    Circle().fill()
                        .frame(width: animate0 ? widthForDotIn(geo.size) : 0,
                               height: animate0 ? widthForDotIn(geo.size) : 0)
                        .offset(offsetForDotAtindex(0, in: geo.size))
                    
                    Circle().fill()
                        .frame(width: animate1 ? widthForDotIn(geo.size) : 0,
                               height: animate1 ? widthForDotIn(geo.size) : 0)
                        .offset(offsetForDotAtindex(1, in: geo.size))
                    
                    Circle().fill()
                        .frame(width: animate2 ? widthForDotIn(geo.size) : 0,
                               height: animate2 ? widthForDotIn(geo.size) : 0)
                        .offset(offsetForDotAtindex(2, in: geo.size))
                    
                }
                //.offset(offsetIn(geo.size))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1.5/6, repeats: true) { (_) in
                        withAnimation(.easeOut(duration: 1.5/6 * 3)) {
        
                            switch animationCounter {
                            case 0:
                                animate0 = true
                            case 1:
                                animate1 = true
                            case 2:
                                animate2 = true
                            case 3:
                                animate0 = false
                            case 4:
                                animate1 = false
                            case 5:
                                animate2 = false
                            default:
                                print(" ERROR: UNEXPECTED COUNTER VALUE")
                                break
                            }
                            
                            animationCounter = (animationCounter + 1) % 6
                        }
                    }
                }
            }
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
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

