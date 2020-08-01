//
//  SlalomingDot.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct SlalomingDot: View {
        
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack(spacing: 2 * widthForDotIn(geo.size)) {
                    ForEach(0..<3) { i in
                        Circle().fill().frame(width: widthForDotIn(geo.size))
                    }
                }.padding(.horizontal, 1.5 * widthForDotIn(geo.size))
                
                Dot()//.opacity(0.5)
                
            }
            
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        min(size.width / 10, size.height / 4)
    }
    
    func spacingBetweenDotsIn(_ size: CGSize) -> CGFloat {
        widthForDotIn(size) / 2
    }
    
    func offsetIn(_ size: CGSize) -> CGSize {
        let halfDotsWidth = min(size.width, size.height) / 2
        return CGSize(width: (size.width / 2) - halfDotsWidth,
               height: (size.height / 2) - (widthForDotIn(size) / 2))
    }
}


struct Dot: View {
    
    @State private var flag = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle()
                    .fill()
                    .frame(width: widthForDotIn(geo.size))
                    .modifier(SlalomEffect(pct: self.flag ? 1 : 0,
                                     path: DotPath().path(in: CGRect(origin: .zero, size: geo.size))))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                            self.flag.toggle()
                        }
                }
            }.offset(x: -geo.size.width * 0.05,y: -geo.size.height / 2)
        }
    }
    
    func widthForDotIn(_ size: CGSize) -> CGFloat {
        min(size.width / 10, size.height / 4)
    }
}


struct SlalomEffect: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path
    
    var animatableData: CGFloat {
        get { return pct }
        set { pct = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let pt = percentPoint(pct)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }

    
    func percentPoint(_ percent: CGFloat) -> CGPoint {
        // percent difference between points
        let diff: CGFloat = 0.001
        let comp: CGFloat = 1 - diff
        
        // handle limits
        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
        
        let f = pct > comp ? comp : pct
        let t = pct > comp ? 1 : pct + diff
        let tp = path.trimmedPath(from: f, to: t)
        
        
        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
    
    
}


struct DotPath: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        let leftCenter = CGPoint(x: rect.width * 0.2, y: rect.midY)
        let center = CGPoint(x: rect.width * 0.5, y: rect.midY)
        let rightCenter = CGPoint(x: rect.width * 0.8, y: rect.midY)
        let radius: CGFloat = rect.width * 0.15
        
        p.addArc(center: leftCenter, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        p.addArc(center: center, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: true)
        p.addArc(center: rightCenter, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
        p.addArc(center: rightCenter, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
        p.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        p.addArc(center: leftCenter, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)

        return p
    }
}


extension SlalomingDot {
    @ViewBuilder
    static func embededSlalomingDot() -> some View {
        GeometryReader { geo in
            ZStack {
                Capsule().foregroundColor(.black)
                    .frame(width: min(geo.size.width, geo.size.height * 2.5),
                           height: min(geo.size.width, geo.size.height * 2.5) * 0.4)
                ZStack {
                    Capsule().foregroundColor(.white)
                    SlalomingDot()
                }.frame(width: min(geo.size.width, geo.size.height * 2.5) * 0.95,
                        height: min(geo.size.width, geo.size.height * 2.5) * 0.36)
            }
            .offset(x: (geo.size.width - min(geo.size.width, geo.size.height * 2.5)) / 2,
                    y: (geo.size.height - min(geo.size.width, geo.size.height * 2.5) * 0.4) / 2)
        }
    }
}
