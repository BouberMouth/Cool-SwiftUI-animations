//
//  ContentView.swift
//  Activity Indicator
//
//  Created by Antoine on 01/08/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                if show {
                    HStack {
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
                    }
                }

            }.padding()
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in 
                show.toggle()
            }
        }
        
    }
}
