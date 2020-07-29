//
//  FillingCheckButton.swift
//  CheckButton
//
//  Created by Antoine on 26/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct FillingCheckButton: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(self.isChecked ? Color.green : Color.red)
                Image(systemName: "checkmark")
                    .font(.system(size: self.fontSizeIn(geo.size)))
                    .foregroundColor(.white)
                Circle().fill(Color(.systemBackground))
                    .frame(width: self.widthForInnerCircleIn(geo.size))
            }.frame(width: self.widthForCircleIn(geo.size))
        }
    }
    
    func widthForCircleIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    func fontSizeIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
    
    func widthForInnerCircleIn(_ size: CGSize) -> CGFloat {
        isChecked ? 0 : widthForCircleIn(size) * 0.9
    }
}

