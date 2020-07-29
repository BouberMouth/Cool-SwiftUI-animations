//
//  PieCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct PieCheckButton: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(Color.green)
                Image(systemName: "checkmark")
                    .font(.system(size: self.fontSizeIn(geo.size)))
                    .foregroundColor(.white)
                Pie(
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: self.isChecked ? -90 : 270)
                ).fill(Color.red)
                
            }.frame(width: self.widthForCircleIn(geo.size))
                .onTapGesture {
                    withAnimation() {
                        self.isChecked.toggle()
                    }
            }
        }
    }
    
    func widthForCircleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func fontSizeIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
}

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            return AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }
}

