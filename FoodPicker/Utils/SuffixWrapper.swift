//
//  SuffixWrapper.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/6/18.
//

import Foundation
import SwiftUI

@propertyWrapper struct Suffix: Equatable {
    var wrappedValue: Double
    private let suffix: String
     
    init(wrappedValue: Double, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }
    
    var projectedValue : String {
        wrappedValue.formatted() + " \(suffix)"
    }
}

extension Suffix: Codable { }
