//
//  SuffixWrapper.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/6/18.
//

import Foundation
import SwiftUI

typealias Energy = Suffix<MyEnergyUnit>
typealias Weight = Suffix<MyWidgetUnit>

@propertyWrapper struct Suffix<Unit: MyUnitProtocol & Equatable>: Equatable {
    var wrappedValue: Double
    var unit: Unit
    var store: UserDefaults = .standard
    
    init(wrappedValue: Double, _ unit: Unit, store : UserDefaults = .standard) {
        self.wrappedValue = wrappedValue
        self.unit = unit 
    }
    
    var projectedValue : Self {
        get { self }
        set { self  = newValue}
    }
    
    var desciption : String {
        let preferredUnit = Unit.getPreferredUnit(from: store)
        let measureMent = Measurement(value: wrappedValue, unit: unit.dimension)
        let converted = measureMent.converted(to: preferredUnit.dimension)
//        return converted.formatted(.measurement(width: .abbreviated, usage: .asProvided, numberFormatStyle: .number.precision(.fractionLength(0...1))))
        return converted.value.formatted(.number.precision(.fractionLength(0...1))) + " " + preferredUnit.localizedSymbol
    }
}

extension Suffix: Codable {
    enum CodingKeys: CodingKey {
        case wrappedValue
        case unit
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Suffix<Unit>.CodingKeys> = try decoder.container(keyedBy: Suffix<Unit>.CodingKeys.self)
        
        self.wrappedValue = try container.decode(Double.self, forKey: Suffix<Unit>.CodingKeys.wrappedValue)
        self.unit = try container.decode(Unit.self, forKey: Suffix<Unit>.CodingKeys.unit)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Suffix<Unit>.CodingKeys.self)
        
        try container.encode(self.wrappedValue, forKey: Suffix.CodingKeys.wrappedValue)
        try container.encode(self.unit, forKey: Suffix.CodingKeys.unit)
    }
}
