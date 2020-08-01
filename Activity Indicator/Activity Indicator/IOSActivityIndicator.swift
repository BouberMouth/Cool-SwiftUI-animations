//
//  IOSActivityIndicator.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct IOSActivityIndicator: View {
    
    @State var indexOfHighlight: Int = 0
    
    var opacities: [Double] = [1,11/12,10/12,9/12,8/12,7/12,6/12,5/12,4/12,3/12,2/12,1/12]
    
    var body: some View {
        GeometryReader { geo in
            ForEach(0..<12) { i in
                Capsule().fill()
                    .frame(width: widthForCapsuleIn(geo.size),
                            height: heightForCapsuleIn(geo.size))
                    .offset(y: heightForCapsuleIn(geo.size) * 1.15)
                    .rotationEffect(angleForIndex(i))
                    .opacity(opacities[(i + indexOfHighlight) % 12])
                    .animation(.linear)
            }
            .offset(x: geo.size.width / 2 - widthForCapsuleIn(geo.size) / 2,
                     y: geo.size.height / 2 - heightForCapsuleIn(geo.size) / 2)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                withAnimation(.linear(duration: 0.5)) {
                    indexOfHighlight = (indexOfHighlight + 1) % 12
                }
            }
        }
    }
    
    func heightForCapsuleIn(_ size: CGSize) -> CGFloat {
        (min(size.width, size.height) / 3) * 0.9
    }
    
    func widthForCapsuleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 9
    }
    
    func angleForIndex(_ index: Int) -> Angle {
        Angle(degrees: (360/12)*Double(index))
    }
}


extension IOSActivityIndicator {
    @ViewBuilder
    static func embededActivityIndicator() -> some View {
        GeometryReader { geo in
            ZStack {
                Color(UIColor.darkGray)
                    .frame(width: min(geo.size.width, geo.size.height),
                           height: min(geo.size.width, geo.size.height))
                    .opacity(0.7)
                    .cornerRadius(min(geo.size.width, geo.size.height)*0.15)
                IOSActivityIndicator()
                    .frame(width: min(geo.size.width, geo.size.height)*0.6,
                           height: min(geo.size.width, geo.size.height)*0.6)
                    .foregroundColor(.white)
            }
            // Center V & H in container
            .offset(x: (geo.size.width - min(geo.size.width, geo.size.height)) / 2,
                    y: (geo.size.height - min(geo.size.width, geo.size.height)) / 2)
        }
    }
}
