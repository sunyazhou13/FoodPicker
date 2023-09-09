//
//  MyUnitProtocol.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/9/9.
//

import Foundation
import SwiftUI

protocol MyUnitProtocol: Codable, Identifiable, CaseIterable, View, RawRepresentable where RawValue == String, AllCases: RandomAccessCollection {
    associatedtype T: Dimension
    static var userDefaultKey: UserDefaults.Key { get }
    static var defaultUnit: Self { get }
    
    var dimension: T { get }
    
}

extension MyUnitProtocol {
    static func getPreferredUnit(from store: UserDefaults = .standard) -> Self {
        AppStorage(userDefaultKey, store: store).wrappedValue
    }
}

extension MyUnitProtocol{
    var localizedSymbol : String {
        return MeasurementFormatter().string(from: dimension)
    }
    
    var body: some View {
        Text(localizedSymbol)
    }
}

extension MyUnitProtocol{
    var id: Self { self }
}

