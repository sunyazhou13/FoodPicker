//
//  FoodDetailSheet.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/8/5.
//

import SwiftUI

extension FoodListScreen {
    struct FoodDetailSheetHeightKey: PreferenceKey {
        static var defaultValue: CGFloat = 300
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
    struct FoodDetailSheet: View {
        @Environment(\.dynamicTypeSize) private var textSize
        @State private var foodDetailHeight: CGFloat = FoodDetailSheetHeightKey.defaultValue
        let food : Food
        
        var body: some View {
            let shouldUseVStack = textSize.isAccessibilitySize || food.image.count > 1
            AnyLayout.userVStack(if: shouldUseVStack, spacing: 30) {
                Text(food.image)
                    .font(.system(size:100))
                    .lineLimit(1)
                    .minimumScaleFactor(shouldUseVStack ? 1 :  0.5)
                
                Grid(horizontalSpacing: 30, verticalSpacing: 12) {
                    buildNutritionView(title: "热量", value: food.$calorie.desciption)
                    buildNutritionView(title: "蛋白质", value: food.$protein.desciption)
                    buildNutritionView(title: "脂肪", value: food.$fat.desciption)
                    buildNutritionView(title: "碳水", value: food.$carb.desciption)
                }
            }
            .padding()
            .padding(.vertical)
            .maxWidth()
            .background(.groupBg2)
            .readGeometry(\.size.height, key: FoodDetailSheetHeightKey.self)
            .onPreferenceChange(FoodDetailSheetHeightKey.self) { foodDetailHeight = $0 }
            .presentationDetents([.height(foodDetailHeight)])
        }
        
        private func buildNutritionView(title: String, value: String) -> some View {
            GridRow {
                Text(title).gridCellAnchor(.leading)
                Text(value).gridCellAnchor(.trailing)
            }
        }
    }
}
