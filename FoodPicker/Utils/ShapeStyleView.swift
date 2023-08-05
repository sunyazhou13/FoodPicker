//
//  ShapeStyleView.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/6/18.
//

import SwiftUI

struct ShapeStyleView: View {
    var body: some View {
        ZStack {
//            Circle().fill(.teal)
//            Circle().fill(.teal.gradient)
//            Circle().fill(.image(.init("dinner"), scale: 0.2))
//            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
//            Circle().fill(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            Circle().fill(.yellow)
            Circle().fill(.image(.init("dinner"), scale: 0.2))
            Text("sunyazhou.com")
                .font(.system(size: 50).bold())
                .foregroundStyle(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                .background{
                    Color
                        .bg2
                        .scaleEffect(x: 1.5, y: 1.3)
                        .blur(radius: 20)
                }
        }
    }
}


struct ShapeStyleView_Preview: PreviewProvider {
    static var previews: some View {
        ShapeStyleView()
    }
}
