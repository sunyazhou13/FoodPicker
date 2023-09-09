//
//  AppStorage+.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/9/2.
//

import SwiftUI

extension AppStorage {
    init(wrappedValue: Value, _ key : UserDefaults.Key, store: UserDefaults? = nil) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key : UserDefaults.Key, store: UserDefaults? = nil) where Value:RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}


extension AppStorage where Value: MyUnitProtocol {
    init(wrappedValue: Value = .defaultUnit, _ key : UserDefaults.Key, store: UserDefaults? = nil) where Value:RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}
