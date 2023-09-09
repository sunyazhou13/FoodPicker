//
//  UserDefaultsKey.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/9/2.
//

import Foundation

extension UserDefaults {
    enum Key: String {
        case shouldUseDarkMode
        case startTab
        case foodList
        case preferredEnergyUnit
        case preferredWeightUnit
    }
}
