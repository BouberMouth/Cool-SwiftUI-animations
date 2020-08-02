//
//  PulsingCapsules.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct PulsingCapsules: View {
    
    @State var indexOfAnimatedCapsule: Int = 0
    @State var decreasing = false
    var numberOfCapsules: Int
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: spacingBetweenCapsulesIn(geo.size)) {
                ForEach(0..<numberOfCapsules) { i in
                    Capsule()
                        .fill()
                        .frame(width: widthForCapsuleIn(geo.size),
                               height: heightForCapsuleAt(i, in: geo.size))
                }
            }
            // Centers H and V in container
            .offset(x: geo.size.width / 2 - ((CGFloat(numberOfCapsules) * 2 - 1) * widthForCapsuleIn(geo.size) / 2),
                y: (geo.size.height/2) - (2*widthForCapsuleIn(geo.size)))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.5/Double(2*(numberOfCapsules-1)), repeats: true) { (_) in
                    withAnimation(.easeOut(duration: 1.5/Double(2*numberOfCapsules))) {
                        if indexOfAnimatedCapsule == numberOfCapsules-1 {
                            decreasing = true
                        } else if indexOfAnimatedCapsule == 0 {
                            decreasing = false
                        }
                        print(indexOfAnimatedCapsule)
                        
                        if !decreasing {
                            indexOfAnimatedCapsule = indexOfAnimatedCapsule + 1
                        } else {
                            indexOfAnimatedCapsule = indexOfAnimatedCapsule - 1
                        }
                    }
                }
            }
        }
    }
    
    func heightForCapsuleAt(_ index: Int, in size: CGSize) -> CGFloat {
        if indexOfAnimatedCapsule == index {
            return widthForCapsuleIn(size) * 4
        } else if abs(indexOfAnimatedCapsule - index) == 1 {
            return widthForCapsuleIn(size) * 3
        } else if abs(indexOfAnimatedCapsule - index) == 2 {
            return widthForCapsuleIn(size) * 2
        }
        return widthForCapsuleIn(size)
    }
    
    func widthForCapsuleIn(_ size: CGSize) -> CGFloat {
        min(size.width / CGFloat((numberOfCapsules * 2) - 1), size.height / 4)
    }
    
    func spacingBetweenCapsulesIn(_ size: CGSize) -> CGFloat {
        widthForCapsuleIn(size)
    }
}

