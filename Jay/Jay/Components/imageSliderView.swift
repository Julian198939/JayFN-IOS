//
//  imageSliderView.swift
//  Jay
//
//  Created by Pocky on 2023/8/14.
//

import SwiftUI

struct imageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["fn1","fn2","fn3","fn4","fn5","fn6","fn7","fn8","fn9","fn10","fn11","fn12","fn13","fn14","fn15"]
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width:350,height: 200)
                // 185
                    .scaledToFit()
                    .cornerRadius(15)
            } //:zstack
            HStack {
                ForEach(0..<slides.count){index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("jPrimary") : Color("jSecondary"))
                        .frame(width: 10,height: 10)
                    
                }
            } //: hstack
            .padding()
        } //: zstack
        .padding()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 10, repeats:true) {
                timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
            
        }
    }
}

struct imageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        imageSliderView()
    }
}
