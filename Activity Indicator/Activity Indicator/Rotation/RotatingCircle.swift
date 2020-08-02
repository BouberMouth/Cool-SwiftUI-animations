//
//  RotatingCircle.swift
//  Activity Indicator
//
//  Created by Antoine on 02/08/2020.
//

import SwiftUI

struct RotatingCircle: View {
    
    @State var rotation: Double = 270
    
    let conic = AngularGradient(gradient: Gradient(colors: [Color(.gray), Color(UIColor.gray.withAlphaComponent(0.1))]), center: .center, startAngle: .degrees(370), endAngle: .degrees(10))
    
    
    var body: some View {
        GeometryReader { geo in
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(conic, style: StrokeStyle(lineWidth: lineWidthIn(geo.size), lineCap: .round))
                .frame(width: widthForCircleIn(geo.size), height: widthForCircleIn(geo.size))
                .rotationEffect(Angle(degrees: rotation))
                .offset(offsetForCircleIn(geo.size))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1.5/360, repeats: true) { (_) in
                        withAnimation(.linear(duration: 1.5/360)) {
                            rotation += 1
                        }
                        if rotation > 360 {
                            rotation = 0
                        }
                    }
                }
                
        }
    }
    
    func widthForCircleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 7 * 6
    }
    
    func lineWidthIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 7
    }
    
    func offsetForCircleIn(_ size: CGSize) -> CGSize {
        CGSize(width: (size.width - widthForCircleIn(size)) / 2,
               height: (size.height - widthForCircleIn(size)) / 2)
    }
}
