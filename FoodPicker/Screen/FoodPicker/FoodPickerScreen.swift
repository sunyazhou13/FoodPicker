//
//  ContentView.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/4/16.
//

import SwiftUI

struct FoodPickerScreen: View {
    @State private var selectedFood: Food?
    @State private var shouldShowInfo: Bool = false
    
    let food = Food.examples
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: 30) {
                    foodImage
                    Text("今天吃什么?").bold()
                    selectedFoodInfoView
                    Spacer().layoutPriority(1)
                    selectFoodButton
                    cancelButton
                }
                .padding()
                .maxWidth()
                .frame(minHeight: proxy.size.height)
                .font(.title)
                .mainButtonStyle()
                .animation(.mySpring, value: shouldShowInfo)
                .animation(.myEase, value: selectedFood)
            }
            .background(.bg2)
        }
    }
}



// MARK: - subviews
private extension FoodPickerScreen {
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(height: 250)
//        .border(.red)
    }
    
    var foodNameView : some View {
        HStack {
            Text(selectedFood!.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .id(selectedFood!.name)
                .transition(.delayInsertionOpacity)
            Button {
                shouldShowInfo.toggle()
            } label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.secondary)
            }.buttonStyle(.plain)

        }
    }
    var foodDetailView: some View {
        VStack {
            if (shouldShowInfo) {
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }.frame(minWidth: 40)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow {
                        Text(selectedFood!.$protein)
                        Text(selectedFood!.$carb)
                        Text(selectedFood!.$fat)
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding()
                .roudedRectBackground()
                .transition(.moveUpWithOpacity)
            }
        }
        .maxWidth()
        .clipped()
    }
    
    
    @ViewBuilder var selectedFoodInfoView: some View {
        if let selectedFood {
            foodNameView
            Text("热量 \(selectedFood.$calorie)").font(.title2)
            foodDetailView
        }
    }
    
    var selectFoodButton : some View {
        Button {
//                withAnimation {
//                }
            selectedFood = food.shuffled().filter {$0 != selectedFood }.first
        } label: {
            Text(selectedFood == .none ? "告诉我!": "换一个").frame(width: 200, alignment: .center)
                .animation(.none, value: selectedFood)
                .transformEffect(.identity)
        }.padding(.bottom, -15)
    }
    
    var cancelButton : some View {
        Button {
//                withAnimation {
//                    selectedFood = .none
//                }
            selectedFood = .none
            shouldShowInfo = false
        } label: {
            Text("重置").frame(width: 200)
        }.buttonStyle(.bordered)
    }
}

extension FoodPickerScreen {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPickerScreen(selectedFood: .examples.first!)
        FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPad)
        FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPhoneSE)
    }
}
