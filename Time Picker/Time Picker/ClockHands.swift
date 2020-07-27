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
    @State var centiseconds: Int = 0
    
    @Binding var minutes: Int
    @Binding var hours: Int
    
    var am: Bool = true
    
    init(seconds: Binding<Int>, intSeconds: Int, minutes: Binding<Int>, hours: Binding<Int>) {
        self._seconds = seconds
        self._centiseconds = State(initialValue: intSeconds * 10)
        self._minutes = minutes
        self._hours = hours
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                self.minuteHandBodyIn(geo.size)
//                self.hourHandBodyIn(geo.size)
//                self.secondHandBodyIn(geo.size)
                Circle().fill(Color.white).frame(width: 10)
            }
        }
    }
    
    //MARK: - SECOND HAND
    
    func lengthForSecondHandIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2 * 0.9
    }
    
    func offsetForSecondHandIn(_ size: CGSize) -> CGFloat {
        lengthForSecondHandIn(size) / 2
    }
    
    func angleForSecondHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 0.6 * Double(centiseconds))
    }
    
    @ViewBuilder
    func secondHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().fill(Color.red)
        }.frame(width: 1, height: self.lengthForSecondHandIn(size))
            .offset(y: -self.offsetForSecondHandIn(size))
            .rotationEffect(self.angleForSecondHandIn(size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    if self.centiseconds == 599 {
                        self.centiseconds = 0
                    } else {
                        withAnimation() {
                            self.centiseconds += 1
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
        lengthForMinuteHandIn(size) / 2
    }
    
    func angleForMinuteHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 6 * Double(minutes))
    }
    
    @ViewBuilder
    func minuteHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().stroke(Color.gray, lineWidth: 1)
            Capsule().fill(Color.white)
        }.frame(width: 5, height: self.lengthForMinuteHandIn(size))
            .offset(y: -self.offsetForMinuteHandIn(size))
            .rotationEffect(self.angleForMinuteHandIn(size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 60/60, repeats: true) { _ in
                    print(self.minutes)
                    if self.minutes == 59 {
                        self.minutes = 0
                    } else {
                        withAnimation() {
                            self.minutes += 1
                        }
                    }
                }
            }
    }
    
    //MARK: - HOUR HAND
    
    func lengthForHourHandIn(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2 * 0.5
    }
    
    func offsetForHourHandIn(_ size: CGSize) -> CGFloat {
        lengthForHourHandIn(size) / 2
    }
    
    func angleForHourHandIn(_ size: CGSize) -> Angle {
        Angle(degrees: 360 / 24 * Double(hours))
    }
    
    @ViewBuilder
    func hourHandBodyIn(_ size: CGSize) -> some View {
        Group {
            Capsule().stroke(Color.gray, lineWidth: 1)
            Capsule().fill(Color.white)
        }.frame(width: 5, height: self.lengthForHourHandIn(size))
            .offset(y: -self.offsetForHourHandIn(size))
            .rotationEffect(self.angleForHourHandIn(size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3600/100, repeats: true) { _ in
                    if self.hours == 24 {
                        self.hours = 0
                    } else {
                        withAnimation() {
                            self.hours += 1
                        }
                    }
                }
            }
    }
}

