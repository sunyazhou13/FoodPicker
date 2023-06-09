//
//  ContentView.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/4/16.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFood: Food?
    @State private var shouldShowInfo: Bool = false
    
    let food = Food.examples
    
    var body: some View {
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
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 100)
            .font(.title)
            .mainButtonStyle()
            .animation(.mySpring, value: shouldShowInfo)
            .animation(.myEase, value: selectedFood)
        }
        .background(.bg2)
    }
}



// MARK: - subviews
private extension ContentView {
    @ViewBuilder var selectedFoodInfoView: some View {
        if let selectedFood {
            foodNameView
        }
        Text("热量 \(selectedFood.$calorie)").font(.title2)
        
        foodDetailView
    }
    
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.7)
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
        //                HStack {
        //                    VStack(spacing: 12) {
        //                        Text("蛋白质")
        //                        Text(selectedFood!.protein.formatted() + " g")
        //                    }
        //                    Divider().frame(width: 1).padding(.horizontal)
        //                    VStack(spacing: 12) {
        //                        Text("脂肪")
        //                        Text(selectedFood!.fat.formatted() + " g")
        //                    }
        //                    Divider().frame(width: 1).padding(.horizontal)
        //                    VStack(spacing: 12) {
        //                        Text("碳水")
        //                        Text(selectedFood!.carb.formatted() + " g")
        //                    }
        //                }
        //                .font(.title3)
        //                .padding(.horizontal)
        //                .padding()
        //                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
        VStack {
            if (shouldShowInfo) {
                Grid {
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
        .frame(maxWidth: .infinity)
        .clipped()
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

extension ContentView {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedFood: .examples.first!)
        ContentView(selectedFood: .examples.first!).previewDevice(.iPad)
        ContentView(selectedFood: .examples.first!).previewDevice(.iPhoneSE)
    }
}
