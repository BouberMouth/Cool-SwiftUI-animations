//
//  ContentView.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = true
    
    var body: some View {
        
        VStack {
            HStack {
                SwappingDots()
                    .padding(.horizontal, 30)
                    .foregroundColor(Color(.darkGray))
                    .aspectRatio(1, contentMode: .fit)
                BouncingDots()
                    .padding(.horizontal, 30)
                    .foregroundColor(Color(.darkGray))
                    .aspectRatio(1, contentMode: .fit)
                SlalomingDot.embeddedSlalomingDot()
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
            }
            Spacer()
            HStack {
                IOSActivityIndicator.embeddedActivityIndicator()
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                DottedCircle()
                    .padding()
                    .foregroundColor(Color(.darkGray))
                    .aspectRatio(1, contentMode: .fit)
                RotatingCircle()
                    .padding(.horizontal, 20)
                    .aspectRatio(1, contentMode: .fit)
            }
            Spacer()
            HStack {
                PulsingCapsules(numberOfCapsules: 15)
                    .padding()
                    .aspectRatio(1, contentMode: .fit)
                PulsingLine()
                    .aspectRatio(1, contentMode: .fit)
                InfiniteDots()
                    .aspectRatio(1, contentMode: .fit)
                    .opacity(0.8)
            }
        }.padding()
    }
}
