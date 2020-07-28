//
//  ClockHands.swift
//  Time Picker
//
//  Created by Antoine on 27/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ClockHands: View {
    @Binding var seconds: Int
    
    var minutes: Double {
        Double(seconds) / 60
    }
    
    var hours: Double {
        Double(seconds) / 3600
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                self.minuteHandBodyIn(geo.size)
                self.hourHandBodyIn(geo.size)
                self.secondHandBodyIn(geo.size)
                Circle().fill().frame(width: 10)
            }
        }
    }
    
    //MARK: - SECOND HAND
    
    func lengthForSecondHandIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2 * 0.98
    }

    func offsetForSecondHandIn(_ size: CGSize) -> CGFloat {
        -lengthForSecondHandIn(size) / 2
    }

    func angleForSecondHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 6 * Double(seconds))
    }

    @ViewBuilder
    func secondHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().fill(Color.red)
        }.frame(width: 1, height: self.lengthForSecondHandIn(size))
            .offset(y: self.offsetForSecondHandIn(size))
            .rotationEffect(self.angleForSecondHandIn(size))
            .shadow(radius: 1)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if self.seconds == 86400 {
                        self.seconds = 0
                    } else {
                        withAnimation(.linear(duration: 1)) {
                            self.seconds += 1
                        }
                    }
                }
            }
    }
    
    //MARK: - MINUTE HAND
    
    func lengthForMinuteHandIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2 * 0.9
    }
    
    func offsetForMinuteHandIn(_ size: CGSize) -> CGFloat {
        -lengthForMinuteHandIn(size) / 2
    }
    
    func angleForMinuteHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 6 * Double(minutes))
    }
    
    @ViewBuilder
    func minuteHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().stroke(Color.gray, lineWidth: 1)
            Capsule()//.fill(Color.white)
        }.frame(width: 5, height: self.lengthForMinuteHandIn(size))
            .offset(y: self.offsetForMinuteHandIn(size))
            .rotationEffect(self.angleForMinuteHandIn(size))
            .shadow(radius: 3)
    }
    
    //MARK: - HOUR HAND
    
    func lengthForHourHandIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2 * 0.5
    }

    func offsetForHourHandIn(_ size: CGSize) -> CGFloat {
        -lengthForHourHandIn(size) / 2
    }

    func angleForHourHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 30 * Double(hours))
    }

    @ViewBuilder
    func hourHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().stroke(Color.gray, lineWidth: 1)
            Capsule()//.fill(Color.white)
        }.frame(width: 5, height: self.lengthForHourHandIn(size))
            .offset(y: self.offsetForHourHandIn(size))
            .rotationEffect(self.angleForHourHandIn(size))
            .shadow(radius: 3)
    }
}

