//
//  ContentView.swift
//  Digital Clock
//
//  Created by Antoine on 29/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var incrementer = 6
    @State var count = 0 {
        didSet {
            var tmp = count
            thousandDigit = tmp / 1000
            tmp %= 1000
            hundredDigit = tmp / 100
            tmp %= 100
            tenDigit = tmp / 10
            tmp %= 10
            oneDigit = tmp
        }
    }
    @State var thousandDigit = 0
    @State var hundredDigit = 0
    @State var tenDigit = 0
    @State var oneDigit = 0
    
    var body: some View {
        HStack {
            DigitalNumber(digit: $thousandDigit)
            DigitalNumber(digit: $hundredDigit)
            DigitalNumber(digit: $tenDigit)
            DigitalNumber(digit: $oneDigit)
            }.padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                withAnimation(.linear(duration: 0.1)) {
                    self.count += 1
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
