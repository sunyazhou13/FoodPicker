//
//  ContentView.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/4/16.
//

import SwiftUI

struct ContentView: View {
    let food = ["汉堡", "沙拉", "披萨", "意大利面", "鸡腿便当", "刀削面", "火锅", "牛肉面", "关东煮"]
    @State private var selectedFood: String?
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("今天吃什么?")
                .bold()
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .id(selectedFood)
                    .transition(.asymmetric(
                        insertion:.opacity
                                  .animation(.easeInOut(duration: 0.5).delay(0.2)),
                        removal:.opacity
                                .animation(.easeInOut(duration: 0.4))))
            }
            
            Button {
//                withAnimation {
//                }
                selectedFood = food.shuffled().filter {$0 != selectedFood }.first
            } label: {
                Text(selectedFood == .none ? "告诉我!": "换一个").frame(width: 200, alignment: .center)
                    .animation(.none, value: selectedFood)
                    .transformEffect(.identity)
            }.padding(.bottom, -15)
            
            Button {
//                withAnimation {
//                    selectedFood = .none
//                }
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }.buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
