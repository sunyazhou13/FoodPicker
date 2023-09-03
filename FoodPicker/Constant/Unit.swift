//
//  Unit.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/9/2.
//

import SwiftUI

enum Unit: String, CaseIterable, Identifiable, View {
    case gram = "g", pounds = "lb"
    var id: Self { self }
    
    var body: some View {
        Text(rawValue)
    }
    
}
