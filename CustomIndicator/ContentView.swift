//
//  ContentView.swift
//  CustomIndicator
//
//  Created by Dhanush on 28/01/20.
//  Copyright © 2020 Dhanush. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack{
            Button(action : {
                self.show.toggle()
            }){
                Text("Check")
                    .onAppear()
            }
            if self.show{
                GeometryReader{_ in
                    Loader()
                }.background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all).onTapGesture {
                    self.show.toggle()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loader : View {
    
    var repeatingAnimation : Animation{
        Animation.linear(duration: 0.7)
            .repeatForever(autoreverses: false)
    }
    
    @State var animate = false
    var body : some View {
        VStack{
            Circle().trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient : .init(colors :[.red,.orange]) , center : .center), style : StrokeStyle(lineWidth : 8, lineCap : .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(repeatingAnimation)
            Text("Please Wait..").padding(.top)
        }
        .padding(20).background(Color.white)
        .cornerRadius(15)
        .onAppear{
            self.animate.toggle()
        }
    }
}

//struct someV : View {
//    @State var size: CGFloat = 0.5
//
//    var repeatingAnimation: Animation {
//        Animation.linear(duration: 0.3)
//            .repeatForever()
//    }
//
//    var body: some View {
//        Text("Hello!")
//            .padding()
//            .scaleEffect(size)
//            .onAppear() {
//                withAnimation(self.repeatingAnimation) { self.size = 1.3 }
//        }
//    }
//}

// can't write .repeat forever directly in View have to divide that into Animation which i have done here with an example
