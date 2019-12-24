//
//  ContentView.swift
//  AppleWatchBreathing WatchKit Extension
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotate_in_out = false
    @State private var scale_in_out  = false
    
    var body: some View {
        ZStack {
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: 42)
                }
            }.opacity(1/3)
            
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: 42)
                }.rotationEffect(.degrees(60)).opacity(1/4)
            }
            
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).offset(y: 42)
                }.rotationEffect(.degrees(120)).opacity(1/4)
            }
        }
        .rotationEffect(.degrees(rotate_in_out ? 90 : 0))
        .scaleEffect(rotate_in_out ? 1 : 1/8)
        .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
        .onAppear() {
            self.rotate_in_out.toggle()
            self.scale_in_out.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
