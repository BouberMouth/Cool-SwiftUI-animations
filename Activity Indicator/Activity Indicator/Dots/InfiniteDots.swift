//
//  InfiniteDots.swift
//  Activity Indicator
//
//  Created by Antoine on 05/08/2020.
//

import SwiftUI

struct InfiniteDots: View {
    
    @State var indexOfHighlight: Int = 1
    
    var opacities: [Double] = [1, 0.5, 0.25, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(1..<8) { i in

                    Circle()
                        .fill()
                        .frame(width: widthForDotIn(geo.size), height: widthForDotIn(geo.size))
                        .offset(x: offsetForCircleIn(geo.size))
                        .rotationEffect(angleForIndex(i))
                        .opacity(opacityAtIndex(i))
                }

               
                Circle()
                    .fill()
                    .frame(width: widthForDotIn(geo.size), height: widthForDotIn(geo.size))
                    .offset(x: offsetForCircleIn(geo.size) + widthForDotIn(geo.size) / 2)
                    .opacity(max(opacityAtIndex(8), opacityAtIndex(16)))
                
                
                ForEach(9..<16) { i in
                        Circle()
                            .fill()
                            .frame(width: widthForDotIn(geo.size), height: widthForDotIn(geo.size))
                            .offset(x: offsetForCircleIn(geo.size))
                            .rotationEffect(angleForIndex(i))
                            .opacity(opacityAtIndex(i))
                }.offset(x: offsetForCircleIn(geo.size) * 2 + widthForDotIn(geo.size))
            }
            .offset(x: offsetForCircleIn(geo.size) + (geo.size.width - 8 * widthForDotIn(geo.size)) / 2,
                    y: offsetForCircleIn(geo.size) + (geo.size.height - 4 * widthForDotIn(geo.size)) / 2)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.5/16, repeats: true) { (_) in
                withAnimation(.linear(duration: 1.5/16)) {
                    indexOfHighlight = indexOfHighlight + 1
                    if indexOfHighlight == 17 {
                        indexOfHighlight = 1
                    }
                }
            }
        }
    }
    
    func offsetForCircleIn(_ size: CGSize) -> CGFloat {
        widthForDotIn(size) * 1.5
    }
    
    func angleForIndex(_ index: Int) -> Angle {
        if index < 8 {
            return Angle(degrees: 45 * Double(index % 8))
        } else if index < 13 {
            return Angle(degrees: 45 * Double(12 - index))
        } else {
            return Angle(degrees: 360 - Double((index - 12) * 45))
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        min(size.width / 9, size.height / 5)
    }
    
    func opacityAtIndex(_ index: Int) -> Double {
        opacities[(indexOfHighlight - index + 16)%16]
    }
}

