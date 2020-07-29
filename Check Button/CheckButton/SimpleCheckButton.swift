//
//  SimpleCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct SimpleCheckButton: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if self.isChecked {
                    Circle().fill(Color.green)
                    Circle().stroke(Color.green, lineWidth: self.lineWidthIn(geo.size))
                    Image(systemName: "checkmark")
                        .font(.system(size: self.fontSizeIn(geo.size)))
                        .foregroundColor(.white)
                } else {
                    Circle().fill(Color(.systemBackground))
                    Circle().stroke(Color.gray, lineWidth: self.lineWidthIn(geo.size))
                }
            }.frame(width: self.widthForCircleIn(geo.size))
        }
    }
    
    func widthForCircleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func fontSizeIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
    
    func lineWidthIn(_ size: CGSize) -> CGFloat {
        widthForCircleIn(size) * 0.05
    }
}

