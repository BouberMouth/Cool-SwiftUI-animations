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
        
        UnamedDots().frame(height: 50)
//
//        VStack {
//            Spacer()
//            HStack {
//                SwappingDots()
//                    .foregroundColor(Color(.darkGray))
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                BouncingDots()
//                    .foregroundColor(Color(.darkGray))
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                SlalomingDot.embeddedSlalomingDot()
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//            }
//
//            HStack {
//                IOSActivityIndicator.embeddedActivityIndicator()
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                DottedCircle()
//                    .foregroundColor(Color(.darkGray))
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                RotatingCircle()
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//            }
//            HStack {
//                PulsingCapsules(numberOfCapsules: 15)
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                PulsingLine()
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//                InfiniteDots()
//                    .aspectRatio(1, contentMode: .fit)
//                    .opacity(0.8)
//                    .padding()
//            }
//            Spacer()
//        }.padding()
    }
}
