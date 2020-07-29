//
//  Stroke.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct Stroke: Shape {
    
    func path(in rect: CGRect) -> Path {
        let tipLength = rect.height / 2
        
        var p = Path()
        
        let leftTip = CGPoint(x: rect.minX, y: rect.midY)
        let bottomLeft = CGPoint(x: tipLength, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX - tipLength, y: rect.maxY)
        let rightTip = CGPoint(x: rect.maxX, y: rect.midY)
        let topRight = CGPoint(x: rect.maxX - tipLength, y: rect.minY)
        let topLeft = CGPoint(x: tipLength, y: rect.minY)
        
        p.addLines([
            leftTip,
            bottomLeft,
            bottomRight,
            rightTip,
            topRight,
            topLeft,
            leftTip
        ])
        
        return p
    }
}
