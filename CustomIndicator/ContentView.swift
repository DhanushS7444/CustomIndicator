//
//  ContentView.swift
//  CustomIndicator
//
//  Created by Dhanush on 28/01/20.
//  Copyright © 2020 Dhanush. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Loader()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loader : View {
    @State var animate = false
    var body : some View {
        VStack{
        
        Circle().trim(from: 0, to: 0.8)
            .stroke(AngularGradient(gradient : .init(colors :[.red,.orange]) , center : .center), style : StrokeStyle(lineWidth : 8, lineCap : .round))
        .frame(width: 45, height: 45)
            .rotationEffect(.init(degrees: self.animate ? 360 : 0))
            .animation(Animation.linear(duration: 0.7))
           .repeatForever(autoreverses: false))
        }.onAppear{
            self.animate.toggle()
        }
    }
}
 

