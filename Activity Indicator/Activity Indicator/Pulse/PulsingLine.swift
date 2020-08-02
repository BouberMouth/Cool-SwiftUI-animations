//
//  PulsingLine.swift
//  Activity Indicator
//
//  Created by Antoine on 02/08/2020.
//

import SwiftUI

struct PulsingLine: View {
    
    @State var trimmingStart: CGFloat = 0
    @State var goingRight: Bool = true
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Pulse()
                    .trim(from: min(trimmingStart, 1), to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(.gray), Color(UIColor.gray.withAlphaComponent(0.1))]), startPoint: .leading, endPoint: .trailing),
                            style: StrokeStyle(lineWidth: lineWidthIn(geo.size), lineCap: .round, lineJoin: .round))
                Pulse()
                    .trim(from: 0, to: min(trimmingStart - 0.05, 1))
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(.gray), Color(UIColor.gray.withAlphaComponent(0.1))]), startPoint: .trailing, endPoint: .leading),
                            style: StrokeStyle(lineWidth: lineWidthIn(geo.size), lineCap: .round, lineJoin: .round))
            }.onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.5/42, repeats: true) { (_) in
                    withAnimation(.linear(duration: 1.5/42)) {
                        trimmingStart += goingRight ? 0.05 : -0.05
                    }
                    if trimmingStart >= 1.05 || trimmingStart <= 0 {
                        goingRight.toggle()
                    }
                }
            }
        }
    }
    
    func lineWidthIn(_ size: CGSize) -> CGFloat {
        min(size.height, size.width) / 20
    }

}

struct Pulse: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.width / 6, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.width / 3, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.width / 1.5 , y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.width / 6 * 5, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        return p
    }
}
