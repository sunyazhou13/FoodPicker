//
//  Unit.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/9/2.
//

import Foundation

enum MyEnergyUnit: String, MyUnitProtocol {
    static var userDefaultKey: UserDefaults.Key = .preferredEnergyUnit
    
    static var defaultUnit: MyEnergyUnit = .cal
    
    case cal = "大卡"
    
    var dimension: UnitEnergy {
        switch self {
            case .cal: return .calories
        }
    }
}

enum MyWidgetUnit: String, MyUnitProtocol {
    case gram = "g", pounds = "lb", ounce

    var dimension: UnitMass {
        switch self {
        case .gram:
            return UnitMass.grams
        case .pounds:
            return UnitMass.pounds
        case .ounce:
            return UnitMass.ounces
        }
    }
    
    static var userDefaultKey: UserDefaults.Key = .preferredWeightUnit
    
    static var defaultUnit: MyWidgetUnit = .gram
    
}


