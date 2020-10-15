//
//  FacebookLikeButton.swift
//  Like Buttons
//
//  Created by Antoine on 15/10/2020.
//

import SwiftUI

struct FacebookLikeButton: View {
    
    @State var isLiked = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(systemName: "hand.thumbsup")
                    .foregroundColor(.gray)
                    .opacity(isLiked ? 0 : 1)
                
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.blue)
                    .opacity(isLiked ? 1 : 0)
            }
            .font(.system(size: min(geo.size.width, geo.size.height) * 0.7))
            .onTapGesture {
                isLiked.toggle()
            }
        }
    }
}
