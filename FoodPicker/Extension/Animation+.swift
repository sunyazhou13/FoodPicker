//
//  Animation+.swift
//  FoodPicker
//
//  Created by sunyazhou on 2023/8/5.
//

import Foundation
import SwiftUI

extension Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}
